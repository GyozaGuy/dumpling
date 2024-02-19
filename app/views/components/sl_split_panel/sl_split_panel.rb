class SlSplitPanel < ApplicationComponent
  attribute :disabled, default: false
  attribute :position
  attribute :position_in_pixels
  attribute :primary
  attribute :snap
  attribute :vertical, default: false
  register_element :sl_split_panel

  def end(&block) = div(slot: 'end', &block)
  def start(&block) = div(slot: 'start', &block)

  def template(&block)
    sl_split_panel(
      **default_attributes,
      disabled:,
      position:,
      position_in_pixels:,
      primary:,
      snap:,
      vertical:,
      &block
    )
  end
end
