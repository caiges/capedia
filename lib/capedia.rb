module Capedia
  VERSION = '0.0.9'

  module Gems

    def install(gem_name, version = nil)
      version_cmd = version.nil? ? '' : "-v=#{version}"
      run "#{try_sudo} gem install #{gem_name} #{version_cmd} --no-ri --no-rdoc"
    end

  end

end

Capistrano.plugin :capedia_gems, Capedia::Gems