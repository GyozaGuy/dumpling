class Section < ApplicationComponent
  include Shared::IsSize

  def template(&block)
    section(**compiled_classes('section'), &block)
  end
end
