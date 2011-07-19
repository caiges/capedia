Capistrano::Configuration.instance.load do

  namespace :deploy do

    desc 'Updates the crontab for each role where a crontab file exists in config/crontab/<stage>/<role>.crontab'
    task :crontab, :except => { :no_release => true } do
      roles.each do |role|
        crontab_file = "#{current_path}/config/crontab/#{fetch(:stage)}/#{role[0]}.crontab"
        run "if [ -f #{crontab_file} ]; then crontab #{crontab_file}; fi", :roles => role[0]
      end
    end

  end

  after 'deploy:restart', 'deploy:crontab'

end