Capistrano::Configuration.instance.load do

  namespace :deploy do

    desc "Stub for starting the application"
    task :start do
    end

    desc "Stub for stopping the application"
    task :stop do
    end

    desc "Restart the application"
    task :restart, :roles => :web, :except => { :no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
    end

  end

end
