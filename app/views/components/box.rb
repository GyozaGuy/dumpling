class Box < ApplicationComponent
  def template(&block)
    div(class: 'box', &block)
  end
end
