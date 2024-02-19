class BLevel < ApplicationComponent
  attribute :mobile, default: false

  def item(&block)
    div(class: 'level-item', &block)
  end

  def left(&block)
    div(class: 'level-left', &block)
  end

  def right(&block)
    div(class: 'level-right', &block)
  end

  def template(&block)
    div(**classes('level', mobile?: 'is-mobile'), &block)
  end
end
