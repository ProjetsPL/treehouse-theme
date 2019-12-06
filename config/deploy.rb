# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, 'treehouse'
set :repo_url, "git@github.com:ProjetsPL/TreeHouse.git"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/deploy/treehouse"

# Default value for :scm is :git
set :scm, :git

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

 desc 'Restart application'
 task :restart do
   on roles(:app), in: :sequence, wait: 5 do
     # Your restart mechanism here, for example:
     # execute :touch, release_path.join('tmp/restart.txt')
   end
 end

 before :restart, :build_public do
   on roles(:app) do
     within release_path do
       execute '/home/deploy/.rvm/gems/ruby-2.1.5/wrappers/jekyll',  "build --destination public"
     end
   end
 end

 after :publishing, :restart

end
