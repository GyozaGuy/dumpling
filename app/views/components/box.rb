class Box < ApplicationComponent
  attribute :href, :string

  def template(&block)
    box_element.call(**props, **compiled_classes('box'), href:, &block)
  end

  private

  def box_element
    href.present? ? method(:a) : method(:div)
  end
end
