desc 'Run Migrations For Databases Of All Tenants.'

# https://github.com/rails/rails/blob/main/activerecord/lib/active_record/railties/databases.rake
# Limitations: Can't pass versions to it. Whole db namespace can be customized to use tenants table.
# Please look at source code above.

namespace :db do
  task :custom_migrate => :environment  do
    puts '================== Custom Migrator Invoked ==========================================='
    Tenant.all.each do |tenant|
      puts "Running Migration For: #{tenant.name}."
      ActiveRecord::Base.connection.execute("use #{Settings.tenant_db_prefix}_#{tenant.subdomain}")
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end
    puts '================== Custom Migrator Finished Processing. =============================='
  end
end
