class ButtonGroup < ApplicationComponent
  include Shared::HasAddons
  include Shared::IsPosition

  def template(&block)
    div(**class_list('buttons'), &block)
  end
end
