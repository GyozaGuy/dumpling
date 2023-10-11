class Section < ApplicationComponent
  include Shared::IsSize

  def template(&block)
    section(**class_list('section'), &block)
  end
end
