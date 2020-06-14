require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


#ActiveRecord::Base.connection.migration_context.needs_migration?

use Rack::MethodOverride
run ApplicationController
use BasketsController
use ProfilesController
use SessionsController
