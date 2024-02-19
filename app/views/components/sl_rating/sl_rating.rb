class SlRating < ApplicationComponent
  attribute :disabled, default: false
  attribute :label
  attribute :max
  attribute :name
  attribute :precision
  attribute :readonly, default: false
  attribute :symbol_size
  attribute :value
  register_element :sl_rating

  def template
    sl_rating(
      **default_attributes,
      disabled:,
      label:,
      max:,
      name:,
      precision:,
      readonly:,
      style: style_string,
      value:
    )
  end

  private

  def style_string
    style_strings = []
    style_strings << "--symbol-size: #{symbol_size};" if symbol_size

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
