class SlTooltip < ApplicationComponent
  attribute :arrow_size
  attribute :content, required: true
  attribute :hoist, default: true
  attribute :max_width
  attribute :open, default: false
  attribute :placement,
    default: :top,
    one_of: %i[
      top
      top_start
      top_end
      right
      right_start
      right_end
      bottom
      bottom_start
      bottom_end
      left
      left_start
      left_end
    ]
  attribute :skidding
  attribute :trigger # Valid values: click, hover, focus, manual
  register_element :sl_tooltip

  def template(&block)
    sl_tooltip(
      **default_attributes,
      content:,
      hoist:,
      open:,
      placement: to_dash(placement),
      skidding:,
      style: style_string,
      trigger:,
      &block
    )
  end

  private

  def style_string
    style_strings = []
    style_strings << "--max-width: #{max_width};" if max_width
    style_strings << "--sl-tooltip-arrow-size: #{arrow_size};" if arrow_size

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
