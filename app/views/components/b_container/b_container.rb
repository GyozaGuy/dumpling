class BContainer < ApplicationComponent
  def template(&block)
    div(class: 'container', &block)
  end
end
