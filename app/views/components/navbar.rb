class Navbar < ApplicationComponent
  include Shared::IsColor

  attribute :fixed, :boolean
  attribute :image, :string
  attribute :image_alt, :string
  attribute :left_items, array: true
  attribute :right_items, array: true
  attribute :shadow, :boolean
  attribute :spaced, :boolean

  def template
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

      div(class: 'navbar-menu', data_navbar_target: 'menu', id: 'navbarMenu') {
        if left_items
          div(class: 'navbar-start') {
            left_items.each do |item|
              a(class: 'navbar-item', href: item[:href]) {
                item[:label]
              }
            end
          }
        end

        if right_items
          div(class: 'navbar-end') {
            right_items.each do |item|
              a(class: 'navbar-item', href: item[:href]) {
                item[:label]
              }
            end
          }
        end
      }
    }
  end

  private

  def fixed? = fixed.present?

  def shadowed? = shadow.present?

  def spaced? = spaced.present?
end
