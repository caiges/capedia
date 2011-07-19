Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :config do

      desc 'Creates shared config files using templates stored in the deploy/config'
      task :setup, :except => { :no_release => true } do
        files = fetch(:config_files, [])
        unless files.empty?
          run "mkdir -p #{shared_path}/config"
          files.each do |file|
            template = File.join('config', 'deploy', 'config', "#{file}.erb")
            raise "Template for #{file} does not exist" unless File.exists?(template)
            put ERB.new(File.read(template)).result(binding), "#{shared_path}/config/#{file}"
          end
        end
      end

      desc 'Symlink shared config files to current release.'
      task :symlink, :except => { :no_release => true } do
        fetch(:config_files, []).each do |file|
          run "ln -nfs #{shared_path}/config/#{file} #{release_path}/config/#{file}"
        end
      end

    end

  end

  after 'deploy:setup', 'deploy:config:setup'
  after 'deploy:update_code', 'deploy:config:symlink'

end
