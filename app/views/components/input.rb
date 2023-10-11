class Input < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  # TODO: finish icons
  attr_accessor(
    :disabled,
    :left_icon,
    :loading,
    :placeholder,
    :readonly,
    :right_icon,
    :rounded,
    :state,
    :static,
    :type,
    :value
  )

  def template
    div(**classes('control', loading?: 'is-loading')) {
      input(
        **classes(
          'input',
          color?: "is-#{color}",
          rounded?: 'is-rounded',
          size?: "is-#{@size}",
          static?: 'is-static'
        ),
        disabled: @disabled ? '' : nil,
        placeholder: @placeholder,
        readonly: @readonly ? '' : nil,
        type: @type || 'text',
        value: @value
      )
    }
  end

  private

  def loading? = @loading == true

  def rounded? = @rounded == true

  def static? = @static == true
end
