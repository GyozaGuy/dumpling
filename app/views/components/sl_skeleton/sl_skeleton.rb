class SlSkeleton < ApplicationComponent
  attribute :color
  attribute :effect, default: :none, one_of: %i[none pulse sheen]
  attribute :sheen_color
  register_element :sl_skeleton

  def view_template
    sl_skeleton(**default_attributes, effect:, style: style_string)
  end

  private

  def style_string
    style_strings = []
    style_strings << "--color: #{color};" if color
    style_strings << "--sheen-color: #{sheen_color};" if sheen_color

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
