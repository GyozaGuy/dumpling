class TagList < ApplicationComponent
  include Shared::AreSize
  include Shared::HasAddons

  def template(&block)
    div(**compiled_classes('tags'), &block)
  end
end
