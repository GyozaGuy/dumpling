class Content < ApplicationComponent
  include Shared::HasTextCentered
  include Shared::IsSize

  def template(&block)
    div(**class_list('content'), &block)
  end
end
