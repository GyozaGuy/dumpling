class Notification < ApplicationComponent
  attr_accessor :color, :light

  def template
    div(
      **classes('notification', colored?: "is-#{@color}", light?: 'is-light'),
      data_controller: 'notification'
    ) {
      d_delete(action: 'notification#close')
      yield
    }
  end

  private

  def colored? = @color.present?

  def light? = @light.present?
end
