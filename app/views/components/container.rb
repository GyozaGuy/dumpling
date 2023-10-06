class Container < ApplicationComponent
  def template(&block)
    div(class: 'container', &block)
  end
end
