class BContainer < ApplicationComponent
  def view_template(&block)
    div(**default_attributes, **classes('container', class_string), &block)
  end
end
