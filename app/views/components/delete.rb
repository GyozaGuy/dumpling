class Delete < ApplicationComponent
  attribute :action, :string
  attribute :href, :string
  attribute :method, :string, default: 'get'

  def template
    if href
      button_to('', href, class: 'delete', method:)
    else
      button(class: 'delete', data: { action: }, type: 'button')
    end
  end
end
