class SlCarousel < ApplicationComponent
  attribute :autoplay, default: false
  attribute :autoplay_interval, default: false
  attribute :loop, default: true
  attribute :mouse_dragging, default: true
  attribute :navigation, default: true
  attribute :orientation
  attribute :pagination, default: true
  attribute :slides_per_move
  attribute :slides_per_page
  register_element :sl_carousel
  register_element :sl_carousel_item

  def item(&block)
    sl_carousel_item(data_component: true, &block)
  end

  def view_template(&block)
    sl_carousel(
      **default_attributes,
      autoplay:,
      autoplay_interval:,
      loop:,
      mouse_dragging:,
      navigation:,
      orientation:,
      pagination:,
      slides_per_move:,
      slides_per_page:,
      &block
    )
  end
end
