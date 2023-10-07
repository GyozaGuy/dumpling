class Menu < ApplicationComponent
  def menu_section(items:, label:)
    p(class: 'menu-label') {
      label
    }
    ul(class: 'menu-list') {
      items.each do |item|
        li {
          a(class: item[:active] ? 'is-active' : nil, href: item[:href]) {
            item[:label]
          }
        }
      end
    }
  end

  def template(&block)
    aside(class: 'menu', &block)
  end
end
