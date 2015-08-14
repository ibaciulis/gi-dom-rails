module Dom
  module Generators
    class PageGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :file, type: :string

      def create_page_files
        parts = %w(pages) + file.split('/')
        parts_camelized = parts.map(&:camelize)
        total_parts = parts.size

        i = 1
        while i < total_parts
          class_file = parts[0..i].join('/') + '.js.coffee'
          class_content = "App.#{parts_camelized[0..i].join('.')} extends App.#{parts_camelized[0..i-1].join('.')}\n\tconstruct: ->"
          create_file "app/assets/javascripts/#{class_file}", class_content
          i += 1
        end
      end

      def refresh_pages_manifest
        content = Dir.glob('app/assets/javascripts/pages/**/*.js.coffee').reverse.each_with_object('') do |path, o|
          path.gsub!(/^app\/assets\/javascripts\//, '')
          path.gsub!(/.js.coffee$/, '')
          o << "#= require #{path}\n"
        end

        File.write('app/assets/javascripts/pages.js.coffee', content)
      end
    end
  end
end