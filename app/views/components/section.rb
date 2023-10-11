class Section < ApplicationComponent
  include Shared::IsSize

  def template(&block)
    section(**classes('section', size?: "is-#{@size}"), &block)
  end
end
