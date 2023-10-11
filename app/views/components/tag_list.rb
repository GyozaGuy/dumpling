class TagList < ApplicationComponent
  include Shared::AreSize

  attr_accessor :addons

  def template(&block)
    div(**class_list('tags', addons?: 'has-addons'), &block)
  end

  private

  def addons? = @addons == true
end
