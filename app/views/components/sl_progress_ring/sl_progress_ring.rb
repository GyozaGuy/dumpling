class SlProgressRing < ApplicationComponent
  attribute :indicator_color
  attribute :indicator_width
  attribute :label
  attribute :size
  attribute :track_color
  attribute :track_width
  attribute :value
  register_element :sl_progress_ring

  def view_template(&block)
    sl_progress_ring(**default_attributes, label:, style: style_string, value:, &block)
  end

  private

  def style_string
    style_strings = []
    style_strings << "--indicator-color: #{indicator_color};" if indicator_color
    style_strings << "--indicator-width: #{indicator_width};" if indicator_width
    style_strings << "--size: #{size};" if size
    style_strings << "--track-color: #{track_color};" if track_color
    style_strings << "--track-width: #{track_width};" if track_width

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
