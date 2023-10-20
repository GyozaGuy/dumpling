class NavbarItem < ApplicationComponent
  attribute :href, :string
  attribute :label, :string

  def template
    a(class: 'navbar-item', href:) {
      label
    }
  end
end
