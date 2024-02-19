class SlIcon < ApplicationComponent
  attribute :label
  attribute :name, required: true
  attribute :slot
  attribute :src
  register_element :sl_icon

  def template
    sl_icon(**default_attributes, label:, name:, slot:, src:)
  end
end
