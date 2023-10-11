class Notification < ApplicationComponent
  include Shared::IsColor

  attr_accessor :light

  def template
    div(
      **class_list('notification', light?: 'is-light'),
      data_controller: 'notification'
    ) {
      d_delete(action: 'notification#close')
      yield
    }
  end

  private

  def light? = @light.present?
end
