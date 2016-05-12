module Calc
  class AutoLoader
    class << self
      LIBRARIES = %w(
        sinatra
        sinatra-initializers
        dotenv
        mongoid
        mini_magick
        carrierwave/mongoid
        tilt/jbuilder
        sidekiq/web
        sidekiq/limit_fetch
      )

      BASE_FILES = %w(
        ./app/models/base.rb
        ./app/controllers/base_controller.rb
        ./app/controllers/application_controller.rb
      )

      DIRECTORIES = %w(
        ./app/uploaders/*.rb
        ./app/workers/*.rb
        ./app/models/*.rb
        ./app/controllers/*.rb
      )

      def load
        require_dependencies LIBRARIES
        require_dir './app/helpers/*.rb'
        require_dependencies BASE_FILES

        DIRECTORIES.each do |directory|
          require_dir directory
        end

        require './application.rb'
      end

      def require_dir(dir)
        require_dependencies(Dir[dir])
      end

      def lazy_load_file(file)
        name = File.basename(file, '.rb').camelize

        Object.autoload(name, file)
      end

      def lazy_load_dir(dir)
        Dir[dir].each { |file| lazy_load_file(file) }
      end

      def require_dependencies(files)
        files.each do |file|
          require file
        end
      end
    end
  end
end