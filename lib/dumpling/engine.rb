module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.assets' do |app|
      app.config.assets.paths << root.join('app', 'components')
      app.config.assets.paths << root.join('app', 'javascript')
      app.config.assets.paths << root.join('app', 'views')
    end

    initializer 'dumpling.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/javascript')
    end

    initializer 'dumpling.precompile' do |app|
      app.config.assets.precompile += %w[dumpling_manifest]
    end

    initializer 'dumpling.view_paths' do
      component_path = root.join('app', 'components')
      ActiveSupport.on_load :action_controller do
        append_view_path component_path
      end
    end
  end
end
