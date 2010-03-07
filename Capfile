load 'deploy' if respond_to?(:namespace) # cap2 differentiator

default_run_options[:pty] = true

config = YAML.load(File.new('deploy.yaml'))

set :user, config['username']
set :domain, 'coreresource.org'
set :application, 'coreresource.org'
set :repository,  'git@github.com:mikelaurence/coreresource.org.git'
set :deploy_to, config['deploy_to']
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end