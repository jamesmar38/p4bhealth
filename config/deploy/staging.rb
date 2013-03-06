set :application_path, "staging"
set :deploy_to, "#{server_root}/#{application_path}"
set :rails_env, "staging"
set :branch, "staging"

server "205.186.165.42", :app, :web, :db, :primary => true

set :document_root, "httpdocs"
set :ee_system, "system"