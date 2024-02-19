class SlSpinner < ApplicationComponent
  attribute :indicator_color
  attribute :size
  attribute :speed
  attribute :track_color
  attribute :track_width
  register_element :sl_spinner

  def template
    sl_spinner(**default_attributes, style: style_string)
  end

  private

  def style_string
    style_strings = []
    style_strings << "font-size: #{size};" if size
    style_strings << "--indicator-color: #{indicator_color};" if indicator_color
    style_strings << "--speed: #{speed};" if speed
    style_strings << "--track-color: #{track_color};" if track_color
    style_strings << "--track-width: #{track_width};" if track_width

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
