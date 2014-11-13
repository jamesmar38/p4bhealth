set :application_path, "production"
set :deploy_to, "#{server_root}/#{application_path}"
set :rails_env, "production"
set :branch, "production"

server "162.243.130.172:5932", :app, :web, :db, :primary => true

set :document_root, "httpdocs"
set :ee_system, "system"
