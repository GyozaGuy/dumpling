class SlRadioGroup < ApplicationComponent
  attribute :name
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :value
  register_element :sl_radio
  register_element :sl_radio_button
  register_element :sl_radio_group

  def button(value:, disabled: false, pill: false, prefix_icon: nil, suffix_icon: nil)
    sl_radio_button(data_component: true, disabled:, pill:, value:) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      yield
      sl_icon(name: suffix_icon, slot: 'suffix') if suffix_icon
    }
  end

  def radio(value:, disabled: false, &block)
    sl_radio(data_component: true, disabled:, value:, &block)
  end

  def view_template(&block)
    sl_radio_group(**default_attributes, name:, size:, value:, &block)
  end
end
