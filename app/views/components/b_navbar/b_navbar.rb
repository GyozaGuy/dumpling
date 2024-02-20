class BNavbar < ApplicationComponent
  include Phlex::DeferredRender

  attribute :color,
    default: nil,
    one_of: [
      nil,
      :black,
      :danger,
      :dark,
      :info,
      :light,
      :link,
      :primary,
      :success,
      :warning,
      :white
    ]
  attribute :fixed, default: nil, one_of: [nil, :bottom, :top]
  attribute :image
  attribute :image_alt
  attribute :shadowed, default: false
  attribute :spaced, default: false
  attribute :transparent, default: false

  def brand(&block) = @brand = block

  def divider
    div(class: 'navbar-divider')
  end

  def dropdown(*bools, text:, &block)
    raise 'Invalid attribute' if bools.any? { !%i[arrowless boxed hoverable right up].include?(_1) }

    arrowless = bools.include?(:arrowless)
    boxed = bools.include?(:boxed)
    hoverable = bools.include?(:hoverable)
    right = bools.include?(:right)
    up = bools.include?(:up)

    div(
      class: "navbar-item has-dropdown#{hoverable ? ' is-hoverable' : nil}#{up ? ' has-dropdown-up' : nil}",
      data_controller: 'b-navbar-menu'
    ) {
      button(
        class: "navbar-link#{arrowless ? ' is-arrowless' : nil}",
        data: { action: hoverable ? nil : 'b-navbar-menu#toggleMenu' },
        type: 'button'
      ) {
        text
      }
      div(class: "navbar-dropdown#{boxed ? ' is-boxed' : nil}#{right ? ' is-right' : nil}", &block)
    }
  end

  def end(&block) = @end = block

  def item(href:, expanded: false, tab: false, &block)
    a(class: "navbar-item#{expanded ? ' is-expanded' : nil}#{tab ? ' is-tab' : nil}", href:, &block)
  end

  def start(&block) = @start = block

  def template
    nav(
      **classes(
        'navbar',
        color?: "is-#{color}",
        fixed?: "is-fixed-#{fixed}",
        shadowed?: 'has-shadow',
        spaced?: 'is-spaced',
        transparent?: 'is-transparent'
      ),
      data: {
        controller: 'b-navbar',
        **data
      },
      role: 'navigation'
    ) {
      div(class: 'navbar-brand') {
        if image
          a(class: 'navbar-item', href: test_path) {
            image_tag(image, alt: image_alt)
          }
        end

        @brand&.call

        a(
          class: 'navbar-burger',
          data: { action: 'b-navbar#toggleMenu', b_navbar_target: 'burger' },
          role: 'button'
        ) {
          3.times do
            span(aria_hidden: true)
          end
        }
      }

      div(class: 'navbar-menu', data_b_navbar_target: 'menu') {
        div(class: 'navbar-start', &@start) if @start
        div(class: 'navbar-end', &@end) if @end
      }
    }
  end
end
