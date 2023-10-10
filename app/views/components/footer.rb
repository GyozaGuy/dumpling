class Footer < ApplicationComponent
  def template(&block)
    footer(class: 'footer', &block)
  end
end
