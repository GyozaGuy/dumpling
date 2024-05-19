class SlDrawer < ApplicationComponent
  attribute :contained, default: false
  attribute :id, required: true
  attribute :label, required: true
  attribute :open, default: false
  attribute :placement, default: :end, one_of: %i[bottom end start top]
  register_element :sl_drawer

  def footer
    sl_button(action: 'visibility#hide', slot: 'footer', variant: :primary) {
      'Close'
    }
  end

  def view_template(&block)
    sl_drawer(
      **default_attributes,
      contained:,
      data: { **data, controller: 'visibility' },
      label: @label,
      open:,
      placement:,
      &block
    )
  end
end
