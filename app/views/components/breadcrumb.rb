class Breadcrumb < ApplicationComponent
  attr_accessor :alignment, :items, :separator, :size

  def template
    nav(
      aria_label: 'breadcrumbs',
      **classes(
        'breadcrumb',
        aligned?: "is-#{@alignment}",
        separated?: "has-#{@separator}-separator",
        sized?: "is-#{@size}"
      )
    ) {
      ul {
        @items.each do |item|
          text, href = item
          li(class: last_item?(item) ? 'is-active' : nil) {
            a(aria_current: last_item?(item) ? 'page' : nil, href: href) {
              text
            }
          }
        end
      }
    }
  end

  private

  def aligned?
    @alignment.present?
  end

  def last_item?(item)
    item == @items.last
  end

  def separated?
    @separator.present?
  end

  def sized?
    @size.present?
  end
end
