class NavbarRight < ApplicationComponent
  def template(&block)
    div(class: 'navbar-end', &block)
  end
end
