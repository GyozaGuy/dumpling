class Content < ApplicationComponent
  attr_accessor :centered, :size

  def template(&block)
    div(**classes('content', centered?: 'has-text-centered', sized?: "is-#{@size}"), &block)
  end

  private

  def centered? = @centered == true

  def sized? = @size.present?
end
