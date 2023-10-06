class Section < ApplicationComponent
  def template(&block)
    section(class: 'section', &block)
  end
end
