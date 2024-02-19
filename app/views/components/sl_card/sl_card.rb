class SlCard < ApplicationComponent
  attribute :image
  attribute :image_alt
  register_element :sl_card

  def footer(&block) = div(slot: 'footer', &block)
  def header(&block) = div(slot: 'header', &block)

  def template
    sl_card(**default_attributes) {
      img(alt: image_alt, slot: 'image', src: image) if image
      yield
    }
  end
end
