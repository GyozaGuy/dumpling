class BBox < ApplicationComponent
  attribute :href
  attribute :target, default: nil, one_of: [nil, :blank]

  def view_template(&block)
    send(
      element_tag,
      **default_attributes,
      **classes(
        'box',
        class_string
      ),
      href:,
      target: target? ? "_#{target}" : nil,
      &block
    )
  end

  private

  def element_tag
    href? ? :a : :div
  end
end
