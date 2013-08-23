set :application, "pbh"
set :stages, %w(development staging production)
set :default_stage, 'staging' 
require 'capistrano/ext/multistage'

set :repository,  "git@github.com:maven20/PBH.git"
set :server_root, "/var/www/vhosts/p4bhealth.org"

set :deploy_via, :remote_cache
default_run_options[:pty] = true

set :ssh_options, { :keys => ['~/.ssh/id_rsa'], :forward_agent => true, :user => "root" }
set :scm, :git
set :use_sudo, false
set :keep_releases, 5
set :copy_strategy, :checkout
set :copy_exclude, [".git", ".gitignore"]
set :keep_releases, 5
set :use_sudo, false
set :copy_compression, :bz2


# Deployment process
after("deploy:setup", "deploy:create_shared")
after("deploy:update", "deploy:cleanup")
after("deploy","deploy:create_cache", "deploy:set_permissions", "deploy:create_symlinks", "deploy:set_permissions")

# Custom deployment tasks
namespace :deploy do
  
  desc "EE: Create shared directories and set permissions after initial setup"
  task :create_shared, :roles => [:app] do
    # create upload directories
    run "mkdir -p #{server_root}/#{shared_dir}/static"
    run "mkdir -p #{server_root}/#{shared_dir}/images"
    run "mkdir -p #{server_root}/#{shared_dir}/images/made"
    run "mkdir -p #{server_root}/#{shared_dir}/images/remote"
    run "mkdir -p #{server_root}/#{shared_dir}/images/avatars/uploads"
    run "mkdir -p #{server_root}/#{shared_dir}/images/captchas"
    run "mkdir -p #{server_root}/#{shared_dir}/images/member_photos"
    run "mkdir -p #{server_root}/#{shared_dir}/images/pm_attachments"
    run "mkdir -p #{server_root}/#{shared_dir}/images/signature_attachments"
    run "mkdir -p #{server_root}/#{shared_dir}/images/uploads"
    run "mkdir -p #{server_root}/#{shared_dir}/logs"
    
    # Custom Upload directories
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/portfolio"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/services"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/home"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/home/promo"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/home/clients"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/team"
    # run "mkdir -p #{server_root}/#{shared_dir}/images/uploads/shop"
  end

  desc "This is here to override the original :restart"
  task :restart, :roles => :app do
    # do nothing but override the default
  end 
   
  desc "EE: Create the cache folder"
  task :create_cache, :roles => [:app] do
    run "mkdir -p #{current_release}/#{ee_system}/expressionengine/cache"
  end

  desc "Set the correct permissions for the config files and cache folder"
  task :set_permissions, :roles => :app do
    run "chmod 666 #{current_release}/#{document_root}/index.php"
    run "chmod 777 #{current_release}/#{document_root}/.htaccess"
    run "chmod 777 #{current_release}/#{ee_system}/expressionengine/cache"
    run "chmod 666 #{current_release}/#{ee_system}/expressionengine/config/config.php"
    run "chmod 666 #{current_release}/#{ee_system}/expressionengine/config/database.php"
    
    run "chmod 777 #{current_release}/templates"
    run "chmod 777 #{server_root}/#{shared_dir}/logs"
    
    run "chmod 777 #{server_root}/#{shared_dir}/static"
    run "chmod 777 #{server_root}/#{shared_dir}/images"
    run "chmod 777 #{server_root}/#{shared_dir}/images/made"
    run "chmod 777 #{server_root}/#{shared_dir}/images/remote"
    run "chmod 777 #{server_root}/#{shared_dir}/images/avatars/uploads"
    run "chmod 777 #{server_root}/#{shared_dir}/images/captchas"
    run "chmod 777 #{server_root}/#{shared_dir}/images/member_photos"
    run "chmod 777 #{server_root}/#{shared_dir}/images/pm_attachments"
    run "chmod 777 #{server_root}/#{shared_dir}/images/signature_attachments"
    
    # -R tag handles all subfolders
    run "chmod -R 777 #{server_root}/#{shared_dir}/images/uploads"
  end
  
  desc "EE: Create symlinks to shared data (eg. config files and uploaded images)"
  task :create_symlinks, :roles => [:app] do
    # standard image upload directories
    run "ln -nfs #{server_root}/#{shared_dir}/static #{current_release}/#{document_root}/static"
    run "ln -nfs #{server_root}/#{shared_dir}/images/made #{current_release}/#{document_root}/images/made"
    run "ln -nfs #{server_root}/#{shared_dir}/images/remote #{current_release}/#{document_root}/images/remote"
    run "ln -nfs #{server_root}/#{shared_dir}/images/avatars/uploads #{current_release}/#{document_root}/images/avatars/uploads"
    run "ln -nfs #{server_root}/#{shared_dir}/images/captchas #{current_release}/#{document_root}/images/captchas"
    run "ln -nfs #{server_root}/#{shared_dir}/images/member_photos #{current_release}/#{document_root}/images/member_photos"
    run "ln -nfs #{server_root}/#{shared_dir}/images/pm_attachments #{current_release}/#{document_root}/images/pm_attachments"
    run "ln -nfs #{server_root}/#{shared_dir}/images/signature_attachments #{current_release}/#{document_root}/images/signature_attachments"
    
    # also handles subfolders of uploads
    run "ln -s #{server_root}/#{shared_dir}/images/uploads #{current_release}/#{document_root}/images/uploads"
  end

end
