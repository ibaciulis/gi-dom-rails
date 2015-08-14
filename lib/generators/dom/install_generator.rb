module Dom
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      def copy_core_dir
        directory 'javascripts/core', 'app/assets/javascripts/core'
      end

      def create_pages_manifest
        create_file 'app/assets/javascripts/pages.js.coffee'
      end
    end
  end
end