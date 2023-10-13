class Notification < ApplicationComponent
  include Shared::IsColor
  include Shared::IsLight

  def template
    div(
      **class_list('notification'),
      data_controller: 'notification'
    ) {
      d_delete(action: 'notification#close')
      yield
    }
  end
end
