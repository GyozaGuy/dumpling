class Dropdown < ApplicationComponent
  include Shared::IsActive
  include Shared::IsHoverable

  attribute :items, array: true
  attribute :label, :string

  def template
    div(
      **class_list('dropdown'),
      data: { controller: 'dropdown' }
    ) {
      div(class: 'dropdown-trigger') {
        button(
          aria_controls: id,
          aria_haspopup: true,
          class: 'button',
          data: { action: 'dropdown#toggle' }
        ) {
          span {
            label
          }
          span(class: 'icon is-small') {
            image_tag('dumpling/icons/chevron_down', aria_hidden: true)
          }
        }
      }

      div(class: 'dropdown-menu', id: id, role: 'menu') {
        div(class: 'dropdown-content') {
          items.each do |item|
            if item == :divider
              hr(class: 'dropdown-divider')
            else
              a(class: 'dropdown-item') {
                item
              }
            end
          end
        }
      }
    }
  end
end
