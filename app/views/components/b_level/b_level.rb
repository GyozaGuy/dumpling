class BLevel < ApplicationComponent
  attribute :mobile, default: false

  def item(...) = render BLevelItem.new(...)
  def left(...) = render BLevelLeft.new(...)
  def right(...) = render BLevelRight.new(...)

  def view_template(&block)
    div(**default_attributes, **classes('level', class_string, mobile?: 'is-mobile'), &block)
  end

  class BLevelItem < ApplicationComponent
    attribute :narrow, default: false

    def view_template(&block)
      div(**classes('level-item', narrow?: 'is-narrow'), &block)
    end
  end

  class BLevelLeft < ApplicationComponent
    def view_template(&block)
      div(**default_attributes, **classes('level-left', class_string), &block)
    end
  end

  class BLevelRight < ApplicationComponent
    def view_template(&block)
      div(**default_attributes, **classes('level-right', class_string), &block)
    end
  end
end
