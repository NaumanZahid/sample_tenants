class ApplicationController < ActionController::Base
  before_action :set_tenant

  def set_tenant
    subdomain = 'kfc' # get tenant name from subdomain
    ActiveRecord::Base.connection.execute("use #{Settings.tenant_db_prefix}_#{subdomain}")
    ActiveRecord::Base.descendants.each do |model|
      model.connection.schema_cache.clear!
      model.reset_column_information
    end
  end
end
