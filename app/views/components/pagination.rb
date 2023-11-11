class Pagination < ApplicationComponent
  include Shared::IsPosition
  include Shared::IsRounded
  include Shared::IsSize

  attribute :current_page, :integer
  attribute :navigate_action, :string
  attribute :navigation_path
  attribute :total_pages, :integer
  attribute :turbo_frame, :string

  def template
    nav(
      aria_label: 'pagination',
      **compiled_classes('pagination'),
      role: 'pagination'
    ) {
      send(
        button_method(first_page?),
        **classes('button', 'pagination-previous', first_page?: 'is-disabled'),
        data: { action: navigate_action, turbo_frame: },
        href: navigation_path.call(page_number: current_page - 1)
      ) {
        'Previous'
      }
      send(
        button_method(last_page?),
        **classes('button', 'pagination-next', last_page?: 'is-disabled'),
        data: { action: navigate_action, turbo_frame: },
        href: navigation_path.call(page_number: current_page + 1)
      ) {
        'Next page'
      }

      ul(class: 'pagination-list') {
        pages_to_show = if total_pages > 5
                          [1, 2, :ellipsis, total_pages - 1, total_pages]
                        else
                          (1..total_pages)
                        end
        pages_to_show.each do |page_number|
          li {
            if page_number == :ellipsis
              span(class: 'pagination-ellipsis') {
                plain '&hellip;'.html_safe
              }

              if current_page > 2 && current_page < total_pages - 1
                button(
                  aria: { current: 'page', label: "go to page #{current_page}" },
                  class: 'button pagination-link is-current'
                ) {
                  current_page
                }
                span(class: 'pagination-ellipsis') {
                  plain '&hellip;'.html_safe
                }
              end
            else
              send(
                button_method(page_number == current_page),
                aria: {
                  current: page_number == current_page ? 'page' : nil,
                  label: "go to page #{page_number}"
                },
                **classes(
                  'button',
                  'pagination-link',
                  page_number == current_page ? 'is-current' : nil
                ),
                data: { action: navigate_action, turbo_frame: },
                href: navigation_path.call(page_number:)
              ) {
                page_number
              }
            end
          }
        end
      }
    }
  end

  private

  def button_method(disabled)
    disabled ? :button : :a
  end

  def first_page? = current_page == 1

  def last_page? = total_pages.zero? || current_page == total_pages
end
