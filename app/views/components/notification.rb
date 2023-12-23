class Notification < ApplicationComponent
  include Shared::IsColor
  include Shared::IsLight

  attribute :action, :string
  attribute :href, :string
  attribute :method, :string

  def template
    div(
      **compiled_classes('notification'),
      data_controller: data[:controller] || 'notification'
    ) {
      d_delete(action: action || 'notification#close', href:, method:)
      yield
    }
  end
end
