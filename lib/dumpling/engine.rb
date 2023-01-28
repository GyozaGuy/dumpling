module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    initializer 'dumpling.assets' do
      Rails.application.config.assets.paths << root.join('app', 'views')
    end
  end
end
