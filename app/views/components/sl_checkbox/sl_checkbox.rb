class SlCheckbox < ApplicationComponent
  attribute :checked, default: false
  attribute :disabled, default: false
  attribute :indeterminate, default: false
  attribute :name
  attribute :size, default: :medium, one_of: %i[small medium large]
  register_element :sl_checkbox

  def template(&block)
    sl_checkbox(**default_attributes, checked:, disabled:, indeterminate:, name:, size:, &block)
  end
end
