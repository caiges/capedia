Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :bundler do

      desc 'Installs all gems for the current release (uses bundler)'
      task :install, :except => { :no_release => true } do
        run "cd #{current_path}; bundle install --path $BUNDLE_PATH"
      end

    end

  end

end
