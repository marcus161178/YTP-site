set :application, "yaisatangwell"
set :repository,  "git@github.com:marcus161178/YTP-site.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, 'deployer'
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :port, 2200

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

role :web, "vps.kinesisstudios.com"                          # Your HTTP server, Apache/etc
role :app, "vps.kinesisstudios.com"                          # This may be the same as your `Web` server
role :db,  "vps.kinesisstudios.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts



# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end