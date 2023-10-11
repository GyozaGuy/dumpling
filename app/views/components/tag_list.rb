class TagList < ApplicationComponent
  include Shared::AreSize

  attr_accessor :addons

  def template(&block)
    div(**classes('tags', addons?: 'has-addons', size?: "are-#{@size}"), &block)
  end

  private

  def addons? = @addons == true
end
