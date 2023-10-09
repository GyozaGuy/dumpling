class TagList < ApplicationComponent
  attr_accessor :addons, :size

  def template(&block)
    div(**classes('tags', addons?: 'has-addons', sized?: "are-#{@size}"), &block)
  end

  private

  def addons? = @addons == true

  def sized? = @size.present?
end
