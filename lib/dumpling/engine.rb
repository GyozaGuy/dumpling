require_relative '../../app/helpers/dumpling/component_helper'

module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.assets' do |app|
      app.config.assets.paths << root.join('app', 'javascript')
      app.config.assets.paths << root.join('app', 'views')
    end

    initializer 'dumpling.app_controllers' do |app|
      app.config.paths['app/controllers'].concat(Dir.glob('app/views/*', base: app.root))
    end

    initializer 'dumpling.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
    end

    initializer 'dumpling.load_components', before: :set_autoload_paths do |app|
      app.config.autoload_paths += Dir[app.root.join('app', 'views')]
      app.config.autoload_paths += Dir[app.root.join('app', 'views', 'components')]
      app.config.autoload_paths += Dir[app.root.join('app', 'views', 'components', '*')]
      app.config.autoload_paths += Dir[app.root.join('app', 'views', 'layouts')]
      app.config.autoload_paths += Dir[root.join('app', 'views')]
      app.config.autoload_paths += Dir[root.join('app', 'views', 'components')]
      app.config.autoload_paths += Dir[root.join('app', 'views', 'layouts')]
    end

    initializer 'dumpling.precompile' do |app|
      app.config.assets.precompile << %w[dumpling_manifest]
    end
  end
end
