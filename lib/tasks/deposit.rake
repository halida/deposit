task :environment => :disable_rails_admin_initializer

namespace :deposit do
  desc "Install deposit"
  task :install do
    system 'rails g deposit_migration'
  end
end

