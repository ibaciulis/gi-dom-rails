module Dom
  module Generators
    class PageGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      argument :file, type: :string

      def create_page_files
        parts = %w(pages) + file.split('/')
        parts_camelized = parts.map(&:camelize)
        total_parts = parts.size

        i = 1
        while i < total_parts
          class_file = parts[0..i].join('/') + '.coffee'
          class_content = "class App.#{parts_camelized[0..i].join('.')} extends App.#{parts_camelized[0..i-1].join('.')}"
          create_file "app/assets/javascripts/#{class_file}", class_content
          i += 1
        end
      end

      def generate_pages_manifest
        generate 'dom:manifest:pages'
      end
    end
  end
end