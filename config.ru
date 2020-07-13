require './config/environment'
require_relative 'app/controllers/recipes_controller'
require_relative 'app/controllers/users_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use RecipesController
use UsersController
run ApplicationController
