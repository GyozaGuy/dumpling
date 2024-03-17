class BLevel < ApplicationComponent
  attribute :mobile, default: false

  def item(&block) = div(class: 'level-item', &block)
  def left(&block) = div(class: 'level-left', &block)
  def right(&block) = div(class: 'level-right', &block)

  def template(&block)
    div(**default_attributes, **classes('level', class_string, mobile?: 'is-mobile'), &block)
  end
end
