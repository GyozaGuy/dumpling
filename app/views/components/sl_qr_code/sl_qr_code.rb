class SlQrCode < ApplicationComponent
  attribute :background
  attribute :error_correction, default: :H, one_of: %i[L M Q H]
  attribute :fill
  attribute :label
  attribute :radius
  attribute :size
  attribute :value, required: true
  register_element :sl_qr_code

  def view_template
    sl_qr_code(
      **default_attributes,
      background:,
      error_correction:,
      fill:,
      label:,
      radius:,
      size:,
      value:
    )
  end
end
