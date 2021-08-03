desc 'Rollback Migrations For Databases Of All Tenants.'

namespace :db do
  task :custom_rollback => :environment  do
    puts '================== Custom Migrator Invoked ==========================================='
    Tenant.all.each do |tenant|
      puts "Running Rollback For: #{tenant.name}."
      ActiveRecord::Base.connection.execute("use #{Settings.tenant_db_prefix}_#{tenant.subdomain}")
      ActiveRecord::Base.connection.migration_context.rollback(1)
    end
    puts '================== Custom Migrator Finished Processing. =============================='
  end
end
