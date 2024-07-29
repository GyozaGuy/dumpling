class BNavbar < ApplicationComponent
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
  attribute :shadowed, default: false
  attribute :spaced, default: false
  attribute :transparent, default: false
  register_element :bulma_navbar

  def brand_image(src:, alt: nil, href: nil)
    if href.present?
      link_to(href, class: 'navbar-item', slot: 'brand-image') do
        image_tag(src, alt:)
      end
    else
      div(class: 'navbar-item', slot: 'brand-image') {
        image_tag(src, alt:)
      }
    end
  end

  def brand_item(href: nil, &block) = item(href:, slot: 'brand', &block)
  def divider = div(class: 'navbar-divider')

  # TODO: Rethink dropdowns
  # def dropdown(*bools, text:, &block)
  #   raise 'Invalid attribute' if bools.any? { !%i[arrowless boxed hoverable right up].include?(_1) }
  #
  #   arrowless = bools.include?(:arrowless)
  #   boxed = bools.include?(:boxed)
  #   hoverable = bools.include?(:hoverable)
  #   right = bools.include?(:right)
  #   up = bools.include?(:up)
  #
  #   div(
  #     class: "navbar-item has-dropdown#{hoverable ? ' is-hoverable' : nil}#{up ? ' has-dropdown-up' : nil}",
  #     data_controller: 'b-navbar-menu'
  #   ) {
  #     button(
  #       class: "navbar-link#{arrowless ? ' is-arrowless' : nil}",
  #       data: { action: hoverable ? nil : 'b-navbar-menu#toggleMenu' },
  #       type: 'button'
  #     ) {
  #       text
  #     }
  #     div(class: "navbar-dropdown#{boxed ? ' is-boxed' : nil}#{right ? ' is-right' : nil}", &block)
  #   }
  # end

  def end_item(href: nil, data: {}, expanded: false, tab: false, &block)
    item(data:, expanded:, href:, slot: 'end', tab:, &block)
  end

  def start_item(href: nil, data: {}, expanded: false, tab: false, &block)
    item(data:, expanded:, href:, slot: 'start', tab:, &block)
  end

  def view_template(&block)
    bulma_navbar(**default_attributes, color:, fixed:, shadowed:, spaced:, transparent:, &block)
  end

  private

  def item(...) = render BNavbarItem.new(...)

  class BNavbarItem < ApplicationComponent
    attribute :expanded, default: false
    attribute :href
    attribute :slot
    attribute :tab, default: false

    def view_template(&block)
      send(
        href.present? ? :a : :div,
        **default_attributes,
        **classes(
          'navbar-item',
          expanded?: 'is-expanded',
          tab?: 'is-tab'
        ),
        data: {
          **default_attributes[:data],
          **data
        },
        href:,
        slot:,
        &block
      )
    end
  end
end
