require 'capedia/config'
require 'capedia/gems'
require 'capedia/bundler'
require 'capedia/passenger'

Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :gems do

      desc 'Installs all gems for the current release'
      task :install, :except => { :no_release => true } do
        if fetch(:bundler, false)
          deploy.bundler.install
        else
          run "cd #{current_path}; rake gems:install"
        end
      end

    end

    namespace :db do

      desc 'Creates the database on the target server if createdb is passed to cap deploy.'
      task :create, :except => { :no_release => true } do
        run "cd #{current_path}; rake db:create RAILS_ENV=#{ fetch( :stage ) }"
      end

      task :create?, :except => { :no_release => true } do
        # If cap deploy -S createdb=true - create the database on the target server.
        deploy.db.create if fetch( :createdb, false )
      end
      
      desc 'Seeds the database on the target server if seeddb is passed to cap deploy.'
      task :seed, :except => { :no_release => true } do
        run "cd #{current_path}; rake db:seed RAILS_ENV=#{ fetch( :stage ) }"
      end

      task :seed?, :except => { :no_release => true } do
        # If cap deploy -S createdb=true - create the database on the target server.
        deploy.db.seed if fetch( :seeddb, false )
      end

    end

  end

  after 'deploy:symlink', 'deploy:gems:install'
  after 'deploy:gems:install', 'deploy:db:create?'
  after 'deploy:db:create?', 'deploy:migrate'
  after 'deploy:migrate', 'deploy:db:seed?'

  after 'deploy:restart', 'deploy:cleanup'
end