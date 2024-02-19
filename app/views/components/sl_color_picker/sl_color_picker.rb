class SlColorPicker < ApplicationComponent
  attribute :disabled, default: false
  attribute :format, default: :hex, one_of: %i[hex hsl hsv rgb]
  attribute :inline, default: false
  attribute :label, required: true
  attribute :name
  attribute :opacity
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :swatches, array: true
  attribute :value
  register_element :sl_color_picker

  def template
    sl_color_picker(
      **default_attributes,
      disabled:,
      format:,
      inline:,
      label:,
      name:,
      opacity:,
      size:,
      swatches:,
      value:
    )
  end
end
