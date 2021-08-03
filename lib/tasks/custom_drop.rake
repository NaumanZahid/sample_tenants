desc 'Drop Databases For All Tenants.'

namespace :db do
  task :custom_drop => :environment  do
    puts '================== Custom Migrator Invoked ==========================================='
    Tenant.all.each do |tenant|
      puts "Running Create For: #{tenant.name}."
      ActiveRecord::Base.connection.execute("drop database IF EXISTS #{Settings.tenant_db_prefix}_#{tenant.subdomain}")
    end
    puts '================== Custom Migrator Finished Processing. =============================='
  end
end
