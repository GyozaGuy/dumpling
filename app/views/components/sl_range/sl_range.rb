class SlRange < ApplicationComponent
  attribute :disabled, default: false
  attribute :help_text
  attribute :label
  attribute :max
  attribute :min
  attribute :name
  attribute :step
  attribute :tooltip, default: :top, one_of: %i[bottom none top]
  attribute :track_active_offset
  attribute :track_color_active
  attribute :track_color_inactive
  attribute :value
  register_element :sl_range

  def template
    sl_range(
      **default_attributes,
      disabled:,
      help_text:,
      label:,
      max:,
      min:,
      name:,
      step:,
      style: style_string,
      tooltip:,
      value:
    )
  end

  private

  def style_string
    style_strings = []
    style_strings << "--track-active-offset: #{track_active_offset};" if track_active_offset
    style_strings << "--track-color-active: #{track_color_active};" if track_color_active
    style_strings << "--track-color-inactive: #{track_color_inactive};" if track_color_inactive

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
