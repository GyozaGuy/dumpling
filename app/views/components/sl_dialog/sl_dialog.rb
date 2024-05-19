class SlDialog < ApplicationComponent
  attribute :id, required: true
  attribute :label, required: true
  register_element :sl_dialog

  def footer
    sl_button(action: 'visibility#hide', slot: 'footer', variant: :primary) { 'Close' }
  end

  def view_template(&block)
    sl_dialog(
      **default_attributes, data: { **data, controller: 'visibility' }, label: @label,
      &block
    )
  end
end
