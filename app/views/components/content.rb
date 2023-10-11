class Content < ApplicationComponent
  include Shared::IsSize

  attr_accessor :centered

  def template(&block)
    div(**class_list('content', centered?: 'has-text-centered'), &block)
  end

  private

  def centered? = @centered == true
end
