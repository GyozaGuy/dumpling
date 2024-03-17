class BContainer < ApplicationComponent
  def template(&block)
    div(**default_attributes, **classes('container', class_string), &block)
  end
end
