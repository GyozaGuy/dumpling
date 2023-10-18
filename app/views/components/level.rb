class Level < ApplicationComponent
  include Shared::IsMobile

  def item(**kwargs, &block)
    d_level_item(**kwargs, &block)
  end

  def template(&block)
    nav(**compiled_classes('level'), &block)
  end
end
