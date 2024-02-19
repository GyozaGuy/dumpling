class SlTag < ApplicationComponent
  attribute :pill, default: false
  attribute :removable, default: false
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :variant, default: :neutral, one_of: %i[danger neutral primary success warning]
  register_element :sl_tag

  def template(&block)
    sl_tag(
      **default_attributes,
      data: {
        action: 'sl-remove->sl-tag#remove',
        controller: 'sl-tag',
        **data
      },
      pill:,
      removable:,
      size:,
      variant:,
      &block
    )
  end
end
