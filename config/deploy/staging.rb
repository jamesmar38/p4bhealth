set :application_path, "staging"
set :deploy_to, "#{server_root}/#{application_path}"
set :rails_env, "staging"
set :branch, "staging"

server "162.243.130.172:5932", :app, :web, :db, :primary => true

set :document_root, "httpdocs"
set :ee_system, "system"
