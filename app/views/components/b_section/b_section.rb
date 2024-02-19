class BSection < ApplicationComponent
  attribute :container, default: true

  def template(&block)
    section(class: 'section') {
      if container?
        b_container(&block)
      else
        yield
      end
    }
  end
end
