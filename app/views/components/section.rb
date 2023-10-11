class Section < ApplicationComponent
  include Shared::HasSize

  def template(&block)
    section(**classes('section', size?: "is-#{@size}"), &block)
  end
end
