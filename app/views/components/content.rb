class Content < ApplicationComponent
  attr_accessor :size

  def template(&block)
    div(**classes('content', sized?: "is-#{@size}"), &block)
  end

  private

  def sized? = @size.present?
end
