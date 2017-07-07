# Load the Rails application.
require_relative 'application'

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
app_environment_variables = File.join(Rails.root, 'config', 'env_var.rb')
load(app_environment_variables) if File.exists?(app_environment_variables)

Encoding.default_external = Encoding::UTF_8

Encoding.default_internal = Encoding::UTF_8

# Initialize the Rails application.
Rails.application.initialize!
