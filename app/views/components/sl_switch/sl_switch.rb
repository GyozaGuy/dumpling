class SlSwitch < ApplicationComponent
  attribute :checked, default: false
  attribute :disabled, default: false
  attribute :size, default: :medium, one_of: %i[small medium large]
  register_element :sl_switch

  def template
    sl_switch(**default_attributes, checked:, disabled:, size:)
  end
end
