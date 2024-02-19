class SlCopyButton < ApplicationComponent
  attribute :copy_icon
  attribute :copy_label
  attribute :disabled, default: false
  attribute :error_icon
  attribute :error_label
  attribute :feedback_duration
  attribute :from
  attribute :success_icon
  attribute :success_label
  attribute :value
  register_element :sl_copy_button

  def template
    sl_copy_button(
      **default_attributes,
      copy_label:,
      disabled:,
      error_label:,
      feedback_duration:,
      from:,
      success_label:,
      value:
    ) {
      sl_icon(name: copy_icon, slot: 'copy-icon') if copy_icon
      sl_icon(name: error_icon, slot: 'error-icon') if error_icon
      sl_icon(name: success_icon, slot: 'success-icon') if success_icon
    }
  end
end
