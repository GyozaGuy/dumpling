class ButtonGroup < ApplicationComponent
  include Shared::HasAddons
  include Shared::IsPosition

  def template(&block)
    div(**compiled_classes('buttons'), &block)
  end
end
