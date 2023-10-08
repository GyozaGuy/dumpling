class Button < ApplicationComponent
  # TODO: icons
  attr_accessor(
    :action,
    :color,
    :disabled,
    :full_width,
    :href,
    :inverted,
    :light,
    :loading,
    :outlined,
    :rounded,
    :selected,
    :size,
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
      **classes(
        'button',
        colored?: "is-#{@color}",
        full_width?: 'is-fullwidth',
        inverted?: 'is-inverted',
        light?: 'is-light',
        loading?: 'is-loading',
        outlined?: 'is-outlined',
        rounded?: 'is-rounded',
        selected?: 'is-selected',
        sized?: "is-#{@size}",
        static?: 'is-static'
      ),
      disabled: @disabled
    )
  end

  def colored? = @color.present?

  def full_width? = @full_width.present?

  def inverted? = @inverted.present?

  def light? = @light.present?

  def loading? = @loading.present?

  def outlined? = @outlined.present?

  def rounded? = @rounded.present?

  def selected? = @selected.present?

  def sized? = @size.present?

  def static? = @static.present?
end
