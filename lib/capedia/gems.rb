Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :gems do

      desc 'One time gem install for gems that need to be installed before a gem autoinstaller can be invoked (i.e. bundler, rails db adapters, etc.)'
      task :setup, :except => { :no_release => true } do
        fetch(:setup_gems, {}).each do |gem_name, version|
          capedia_gems.install gem_name, version
        end
      end

    end

  end

  after 'deploy:setup', 'deploy:gems:setup'

end
