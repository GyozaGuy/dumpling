class Navbar < ApplicationComponent
  include Shared::IsColor

  attribute :fixed, :boolean
  attribute :image, :string
  attribute :image_alt, :string
  attribute :shadow, :boolean
  attribute :spaced, :boolean

  def left(&block)
    d_navbar_left(&block)
  end

  def right(&block)
    d_navbar_right(&block)
  end

  def template(&block)
    nav(
      aria_label: 'main navigation',
      **class_list(
        'navbar',
        fixed?: 'is-fixed-top',
        shadowed?: 'has-shadow',
        spaced?: 'is-spaced'
      ),
      data_controller: 'navbar',
      role: 'navigation'
    ) {
      div(class: 'navbar-brand') {
        if image
          a(class: 'navbar-item', href: '/') {
            image_tag(image, alt: image_alt)
          }
        end

        button(
          aria: { expanded: 'false', label: 'menu' },
          class: 'navbar-burger',
          data: { action: 'navbar#toggleMenu', navbar_target: 'menuButton', target: 'navbarMenu' }
        ) {
          3.times do
            span(aria_hidden: true)
          end
        }
      }

      div(class: 'navbar-menu', data_navbar_target: 'menu', id: 'navbarMenu', &block)
    }
  end

  private

  def fixed? = fixed.present?

  def shadowed? = shadow.present?

  def spaced? = spaced.present?
end
