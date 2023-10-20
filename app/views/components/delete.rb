class Delete < ApplicationComponent
  attribute :action, :string

  def template
    button(class: 'delete', data: { action: }, type: 'button')
  end
end
