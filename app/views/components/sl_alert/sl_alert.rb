class SlAlert < ApplicationComponent
  attribute :closable, default: false
  attribute :duration
  attribute :hide_icon, default: false
  attribute :icon
  attribute :open, default: true
  attribute :variant, default: :primary, one_of: %i[danger neutral primary success warning]
  register_element :sl_alert

  def template
    sl_alert(
      **default_attributes,
      closable:,
      duration:,
      open:,
      variant:
    ) {
      sl_icon(name: icon || icon_for_variant, slot: 'icon') unless hide_icon
      yield
    }
  end

  private

  def icon_for_variant
    {
      danger: 'exclamation-triangle',
      neutral: 'gear',
      primary: 'info-circle',
      success: 'check2-circle',
      warning: 'exclamation-triangle'
    }[variant]
  end
end
