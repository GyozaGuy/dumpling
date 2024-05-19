class SlButtonGroup < ApplicationComponent
  attribute :label, required: true
  register_element :sl_button_group

  def view_template(&block)
    sl_button_group(**default_attributes, label:, &block)
  end
end
