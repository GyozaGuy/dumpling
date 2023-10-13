class LevelItem < ApplicationComponent
  include Shared::HasTextCentered

  def template(&block)
    div(**class_list('level-item'), &block)
  end
end
