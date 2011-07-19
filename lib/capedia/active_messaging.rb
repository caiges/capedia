Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :pollers do
      
      desc "Starts the poller"
      task :start, :roles => :app do
        fetch(:poller_count, 0).times do
          run "#{current_path}/script/poller start"
        end
      end

      desc "Stops the poller"
      task :stop, :roles => :app do
        run "#{current_path}/script/poller stop"
      end

      desc "Restarts the poller"
      task :restart, :roles => :app do
        deploy.pollers.stop
        deploy.pollers.start
      end

    end

  end

  after 'deploy:restart', 'deploy:pollers:restart'

end
