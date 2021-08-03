desc 'Create Databases For All Tenants.'

namespace :db do
  task :custom_create => :environment  do
    puts '================== Custom Migrator Invoked ==========================================='
    Tenant.all.each do |tenant|
      puts "Running Create For: #{tenant.name}."
      ActiveRecord::Base.connection.execute("create database IF NOT EXISTS #{Settings.tenant_db_prefix}_#{tenant.subdomain}")
    end
    puts '================== Custom Migrator Finished Processing. =============================='
  end
end
