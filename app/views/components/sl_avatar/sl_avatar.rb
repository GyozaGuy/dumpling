class SlAvatar < ApplicationComponent
  attribute :icon
  attribute :image
  attribute :initials
  attribute :label, required: true
  attribute :shape, default: :circle, one_of: %i[circle rounded square]
  register_element :sl_avatar

  def template
    sl_avatar(**default_attributes, image:, initials:, label: @label, shape:) {
      sl_icon(name: icon, slot: 'icon') if icon
    }
  end
end
