class Section < ApplicationComponent
  include Shared::IsSize

  def template(&block)
    section(**props, **compiled_classes('section'), &block)
  end
end
