class SlIconButton < ApplicationComponent
  attribute :action
  attribute :disabled, default: false
  attribute :href
  attribute :name, required: true
  register_element :sl_icon_button

  def template
    sl_icon_button(**default_attributes, action: "click->#{action}", disabled:, href:, name:)
  end
end
