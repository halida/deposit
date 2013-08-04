require "active_record"

module Deposit
  module Depositable
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_depositable
        include AsDepositable
      end
    end
  end

  module AsDepositable
    extend ActiveSupport::Concern

    included do
      has_many :deposit_slots, class_name: "Deposit::DepositSlot", as: :item, dependent: :destroy
    end

    def save_deposit key, value
      d = self.deposit_slots.find_or_create_by_key key.to_s
      d.data = value
      d.save
    end

    def load_deposit key
      d = self.deposit_slots.where(key: key.to_s).first
      return nil unless d
      return d.data
    end

    def update_deposit key, value
      data = self.load_deposit(key) || {}
      data.merge!(value)
      self.save_deposit(key, data)
    end

  end

  class DepositSlot < ActiveRecord::Base
    belongs_to :item, polymorphic: true
    serialize :data
  end

end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:include, Deposit::Depositable)
end
