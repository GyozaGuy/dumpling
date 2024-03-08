class BBlock < ApplicationComponent
  def template(&block)
    div(**default_attributes, **classes('block', class_string), &block)
  end
end
