class BLevel < ApplicationComponent
  attribute :mobile, default: false

  def item(...) = render BLevelItem.new(...)
  def left(&block) = div(class: 'level-left', &block)
  def right(&block) = div(class: 'level-right', &block)

  def template(&block)
    div(**default_attributes, **classes('level', class_string, mobile?: 'is-mobile'), &block)
  end

  class BLevelItem < ApplicationComponent
    attribute :narrow, default: false

    def template(&block)
      div(**classes('level-item', narrow?: 'is-narrow'), &block)
    end
  end
end
