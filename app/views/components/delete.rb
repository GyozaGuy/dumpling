class Delete < ApplicationComponent
  attr_accessor :action

  def template
    button(class: 'delete', data: { action: @action }, type: 'button')
  end
end
