module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.app_assets' do |app|
      app.config.assets.paths << app.root.join('app', 'components')
      app.config.assets.paths << app.root.join('app', 'views')
    end

    initializer 'dumpling.assets' do |app|
      app.config.assets.paths << root.join('app', 'components')
      app.config.assets.paths << root.join('app', 'javascript')
      app.config.assets.paths << root.join('app', 'views')
    end

    initializer 'dumpling.app_controllers' do |app|
      app.config.paths['app/controllers'].concat(Dir.glob('app/views/*', base: app.root))
    end

    initializer 'dumpling.controllers' do
      config.paths['app/controllers'].concat(Dir.glob('app/views/*', base: root))
    end

    initializer 'dumpling.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
    end

    initializer 'dumpling.load_components', before: :set_autoload_paths do |app|
      app.config.autoload_paths += Dir["#{app.root.join('app', 'components')}/{*}"]
      app.config.autoload_paths += Dir["#{root.join('app', 'components')}/{*}"]
    end

    initializer 'dumpling.precompile' do |app|
      app.config.assets.precompile << %w[dumpling_manifest]
    end

    initializer 'dumpling.app_view_paths' do |app|
      components_path = app.root.join('app', 'components')

      ActiveSupport.on_load :action_controller do
        append_view_path components_path
      end
    end

    initializer 'dumpling.view_paths' do
      components_path = root.join('app', 'components')

      ActiveSupport.on_load :action_controller do
        append_view_path components_path
      end
    end
  end
end
