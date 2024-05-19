class BSection < ApplicationComponent
  attribute :container, default: true

  def view_template(&block)
    section(**default_attributes, **classes('section', class_string)) {
      if container?
        b_container(&block)
      else
        yield
      end
    }
  end
end
