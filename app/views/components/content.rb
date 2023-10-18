class Content < ApplicationComponent
  include Shared::HasTextCentered
  include Shared::IsSize

  def template(&block)
    div(**compiled_classes('content'), &block)
  end
end
