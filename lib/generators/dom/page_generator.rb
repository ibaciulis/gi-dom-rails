module Dom
  module Generators
    class PageGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      argument :file, type: :string
      class_option :namespace, type: 'string', default: 'App', description: 'JS class namespace: App.Foobar, Admin.Foobar'
      class_option :path, type: 'string', default: 'app/assets/javascripts', description: 'Path where to save generated files'

      def create_page_files
        parts = %w(pages) + file.split('/')
        parts_camelized = parts.map(&:camelize)
        total_parts = parts.size

        i = 1
        while i < total_parts
          class_file = parts[0..i].join('/') + '.coffee'
          class_content = "class #{options.namespace}.#{parts_camelized[0..i].join('.')} extends #{options.namespace}.#{parts_camelized[0..i-1].join('.')}"
          create_file "#{options.path.gsub(/\/$/, '')}/#{class_file}", class_content
          i += 1
        end
      end

      def generate_pages_manifest
        generate "dom:manifest:pages --path #{options.path}"
      end
    end
  end
end