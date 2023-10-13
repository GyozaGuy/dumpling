class Button < ApplicationComponent
  include Shared::IsColor
  include Shared::IsLight
  include Shared::IsRounded
  include Shared::IsSize

  # TODO: icons
  attribute :action, :string
  attribute :disabled, :boolean
  attribute :full_width, :boolean
  attribute :href, :string
  attribute :inverted, :boolean
  attribute :loading, :boolean
  attribute :outlined, :boolean
  attribute :selected, :boolean
  attribute :static, :boolean
  attribute :target, :string
  attribute :text, :string

  def template
    if href
      a(**button_props, href: href, target: target) {
        text || yield
      }
    else
      button(**button_props, data_action: action) {
        text || yield
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
        loading?: 'is-loading',
        outlined?: 'is-outlined',
        selected?: 'is-selected',
        static?: 'is-static'
      ),
      disabled: disabled
    )
  end

  def full_width? = full_width == true

  def inverted? = inverted == true

  def loading? = loading == true

  def outlined? = outlined == true

  def selected? = selected == true

  def static? = static == true
end
