class Button < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  # TODO: icons
  attr_accessor(
    :action,
    :disabled,
    :full_width,
    :href,
    :inverted,
    :light,
    :loading,
    :outlined,
    :rounded,
    :selected,
    :static,
    :target,
    :text
  )

  def template
    if @href
      a(**button_props, href: @href, target: @target) {
        @text || yield
      }
    else
      button(**button_props, data_action: @action) {
        @text || yield
      }
    end
  end

  private

  def button_props
    props(
      **class_list(
        'button',
        full_width?: 'is-fullwidth',
        inverted?: 'is-inverted',
        light?: 'is-light',
        loading?: 'is-loading',
        outlined?: 'is-outlined',
        rounded?: 'is-rounded',
        selected?: 'is-selected',
        size?: "is-#{@size}",
        static?: 'is-static'
      ),
      disabled: @disabled
    )
  end

  def full_width? = @full_width.present?

  def inverted? = @inverted.present?

  def light? = @light.present?

  def loading? = @loading.present?

  def outlined? = @outlined.present?

  def rounded? = @rounded.present?

  def selected? = @selected.present?

  def static? = @static.present?
end
