class NavbarLeft < ApplicationComponent
  def template(&block)
    div(class: 'navbar-start', &block)
  end
end
