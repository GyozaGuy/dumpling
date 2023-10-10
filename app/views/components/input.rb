class Input < ApplicationComponent
  # TODO: finish icons
  attr_accessor(
    :color,
    :disabled,
    :left_icon,
    :loading,
    :placeholder,
    :readonly,
    :right_icon,
    :rounded,
    :size,
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
          colored?: "is-#{@color}",
          rounded?: 'is-rounded',
          sized?: "is-#{@size}",
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

  def colored? = @color.present?

  def loading? = @loading == true

  def rounded? = @rounded == true

  def sized? = @size.present?

  def static? = @static == true
end
