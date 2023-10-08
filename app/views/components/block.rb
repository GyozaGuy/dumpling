class Block < ApplicationComponent
  def template(&block)
    div(class: 'block', &block)
  end
end
