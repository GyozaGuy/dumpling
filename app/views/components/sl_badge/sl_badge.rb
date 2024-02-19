class SlBadge < ApplicationComponent
  attribute :pill, default: false
  attribute :pulse, default: false
  attribute :slot
  attribute :variant, default: :primary, one_of: %i[danger neutral primary success warning]
  register_element :sl_badge

  def template(&block)
    sl_badge(**default_attributes, pill:, pulse:, slot:, variant:, &block)
  end
end
