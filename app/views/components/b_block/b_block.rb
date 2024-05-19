class BBlock < ApplicationComponent
  def view_template(&block)
    div(**default_attributes, **classes('block', class_string), &block)
  end
end
