module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.assets' do |app|
      app.config.assets.paths << root.join('app', 'views')
    end

    initializer 'dumpling.assets.precompile' do |app|
      app.config.assets.precompile += %w[dumpling/application.css]
    end
  end
end
