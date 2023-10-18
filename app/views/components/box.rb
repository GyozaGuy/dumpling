class Box < ApplicationComponent
  attribute :href, :string

  def template(&block)
    box_element.call(class: 'box', href: href, &block)
  end

  private

  def box_element
    href.present? ? method(:a) : method(:div)
  end
end
