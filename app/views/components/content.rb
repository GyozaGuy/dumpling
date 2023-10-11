class Content < ApplicationComponent
  include Shared::IsSize

  attr_accessor :centered

  def template(&block)
    div(**classes('content', centered?: 'has-text-centered', size?: "is-#{@size}"), &block)
  end

  private

  def centered? = @centered == true
end
