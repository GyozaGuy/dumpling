class BBox < ApplicationComponent
  attribute :href
  attribute :target, default: nil, one_of: [nil, :blank]

  def template(&block)
    send(element_tag, class: 'box', href:, target: "_#{target}", &block)
  end

  private

  def element_tag
    href? ? :a : :div
  end
end
