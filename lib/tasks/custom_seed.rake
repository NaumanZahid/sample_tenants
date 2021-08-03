desc 'Enter Seed Data For Databases Of All Tenants.'

namespace :db do
  task :custom_seed  => :environment do
    puts '================== Custom Seed Invoked ==========================================='
    Tenant.all.each do |tenant|
      puts "Running Seed For: #{tenant.name}."
      Rails.application.load_seed
    end
    puts '================== Custom Seed Finished Processing. =============================='
  end
end