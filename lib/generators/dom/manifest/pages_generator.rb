module Dom
  module Manifest
    class PagesGenerator < Rails::Generators::Base
      def create_pages_manifest
        content = Dir.glob('app/assets/javascripts/pages/**/*.coffee').reverse.each_with_object('') do |path, o|
          path.gsub!(/^app\/assets\/javascripts\//, '')
          path.gsub!(/(.js)?.coffee$/, '')
          o << "#= require #{path}\n"
        end

        FileUtils.rm('app/assets/javascripts/pages.js.coffee') if File.exist?('app/assets/javascripts/pages.js.coffee')
        File.write('app/assets/javascripts/pages.coffee', content)
      end
    end
  end
end