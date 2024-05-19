class SlDivider < ApplicationComponent
  attribute :color
  attribute :spacing
  attribute :vertical
  attribute :width
  register_element :sl_divider

  def view_template
    sl_divider(**default_attributes, style: style_string, vertical:)
  end

  private

  def style_string
    style_strings = []
    style_strings << "--color: #{color};" if color
    style_strings << "--spacing: #{spacing};" if spacing
    style_strings << "--width: #{width};" if width

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
