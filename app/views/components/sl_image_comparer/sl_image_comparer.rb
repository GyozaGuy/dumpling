class SlImageComparer < ApplicationComponent
  attribute :position
  register_element :sl_image_comparer

  def after(alt:, src:) = img(alt:, slot: 'after', src:)
  def before(alt:, src:) = img(alt:, slot: 'before', src:)

  def view_template(&block)
    sl_image_comparer(**default_attributes, position:, &block)
  end
end
