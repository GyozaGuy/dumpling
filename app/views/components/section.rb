class Section < ApplicationComponent
  attr_accessor :size

  def template(&block)
    section(**classes('section', sized?: "is-#{@size}"), &block)
  end

  private

  def sized? = @size.present?
end
