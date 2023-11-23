class NavbarItem < ApplicationComponent
  attribute :href, :string
  attribute :label, :string

  def template
    send(item_tag, class: 'navbar-item', href:) {
      label
    }
  end

  private

  def item_tag
    href.present? ? :a : :div
  end
end
