module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.assets' do |app|
      app.config.assets.paths << root.join('app', 'javascript')
      app.config.assets.paths << root.join('app', 'views')
    end

    initializer 'dumpling.assets.precompile' do |app|
      app.config.assets.precompile += %w[dumpling.css]
      app.config.assets.precompile += %w[dumpling_manifest]
    end

    initializer 'dumpling.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/javascript')
    end
  end
end
