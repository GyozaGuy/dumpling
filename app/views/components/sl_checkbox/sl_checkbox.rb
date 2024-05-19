class SlCheckbox < ApplicationComponent
  attribute :checked, default: false
  attribute :disabled, default: false
  attribute :indeterminate, default: false
  attribute :name
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :value
  register_element :sl_checkbox

  def view_template(&block)
    sl_checkbox(
      **default_attributes, checked:, disabled:, indeterminate:, name:, size:, value:,
      &block
    )
  end
end
