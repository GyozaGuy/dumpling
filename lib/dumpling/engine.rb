module Dumpling
  class Engine < ::Rails::Engine
    isolate_namespace Dumpling

    paths['app/controllers'].concat(Dir.glob('app/views/*', base: root))
    paths['app/helpers'] << root.join('app', 'components')
    config.assets.paths << root.join('app', 'views')
  end
end
