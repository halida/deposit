require 'spec_helper'

# Generators are not automatically loaded by Rails
require File.expand_path('../../../lib/generators/deposit_migration/deposit_migration_generator', __FILE__)

describe DepositMigrationGenerator do
  # TODO: undefined method `destination'?

  # # Tell the generator where to put its output (what it thinks of as Rails.root)
  # destination File.expand_path("../../../../../tmp", __FILE__)

  # before do
  #   prepare_destination
  # end

  # describe 'no arguments' do
  #   before { run_generator  }

  #   describe 'db/migrate/acts_as_taggable_on_migration.rb' do
  #     subject { file('db/migrate/acts_as_taggable_on_migration.rb') }
  #     it { should be_a_migration }
  #   end
  # end
end
