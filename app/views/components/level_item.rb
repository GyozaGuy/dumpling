class LevelItem < ApplicationComponent
  include Shared::HasTextCentered

  def template(&block)
    div(**compiled_classes('level-item'), &block)
  end
end
