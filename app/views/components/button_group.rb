class ButtonGroup < ApplicationComponent
  attr_accessor :addons, :position

  def template(&block)
    div(**classes('buttons', addons?: 'has-addons', position?: "is-#{@position}"), &block)
  end

  private

  def addons? = @addons.present?

  def position? = @position.present?
end
