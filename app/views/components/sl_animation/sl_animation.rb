class SlAnimation < ApplicationComponent
  attribute :duration, default: 2000
  attribute :easing, default: 'ease-in-out'
  attribute :name, required: true
  attribute :play, default: true
  register_element :sl_animation

  def view_template(&block)
    sl_animation(**default_attributes, duration:, easing:, name:, play:, &block)
  end
end
