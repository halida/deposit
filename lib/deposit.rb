require "active_record"

module Deposit
  module Depositable
    def as_depositable
      self.class.instance_eval do
        include AsDepositable      
      end
    end
  end

  module AsDepositable
    extend ActiveSupport::Concern

    included do
      has_one :deposit, as: :item, dependent: :destroy
    end

    def deposit
      return self[:deposit] if self[:deposit]
      return Deposit.find_or_create_by_item_id_and_item_type(item_id: self.id, item_type: "User")
    end

    def save_deposit name, value
      d = self.deposit
      d.data[name] = value
      d.save
    end

    def load_deposit name
      self.deposit.data[name]
    end

  end
end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:include, Deposit::Depositable)
end
