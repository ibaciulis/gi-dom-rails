module Dom
  module Manifest
    class PagesGenerator < Rails::Generators::Base
      class_option :path, type: 'string', default: 'app/assets/javascripts', description: 'Path where to save generated files'

      def create_pages_manifest
        js_assets_path = options.path.gsub(/\/$/, '')
        reg = Regexp.new("^#{js_assets_path}/")

        content = Dir.glob("#{js_assets_path}/pages/**/*.coffee").reverse.each_with_object('') do |path, o|
          path.gsub!(reg, '')
          path.gsub!(/(.js)?.coffee$/, '')
          o << "#= require ./#{path}\n"
        end

        FileUtils.rm("#{js_assets_path}/pages.js.coffee") if File.exist?("#{js_assets_path}/pages.js.coffee")
        File.write("#{js_assets_path}/pages.coffee", content)
      end
    end
  end
end