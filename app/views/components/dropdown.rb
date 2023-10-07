class Dropdown < ApplicationComponent
  include Phlex::DeferredRender

  attr_accessor :active, :hoverable, :items, :text

  def template
    div(
      **classes('dropdown', active?: 'is-active', hoverable?: 'is-hoverable'),
      data: { controller: 'dropdown' }
    ) {
      div(class: 'dropdown-trigger') {
        button(
          aria_controls: @id,
          aria_haspopup: true,
          class: 'button',
          data: { action: 'dropdown#toggle' }
        ) {
          span {
            @text
          }
          span(class: 'icon is-small') {
            image_tag('dumpling/icons/chevron_down', aria_hidden: true)
          }
        }
      }

      div(class: 'dropdown-menu', id: @id, role: 'menu') {
        div(class: 'dropdown-content') {
          @items.each do |item|
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

  private

  def active? = @active.present?

  def hoverable? = @hoverable.present?
end
