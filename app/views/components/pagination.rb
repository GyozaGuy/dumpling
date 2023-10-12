class Pagination < ApplicationComponent
  include Shared::IsRounded
  include Shared::IsSize

  attr_accessor :current_page, :pages, :position

  def template
    nav(
      aria_label: 'pagination',
      **class_list(
        'pagination',
        position?: "is-#{@position}"
      ),
      role: 'pagination'
    ) {
      a(**classes('pagination-previous', first_page?: 'is-disabled')) {
        'Previous'
      }
      a(**classes('pagination-next', last_page?: 'is-disabled')) {
        'Next page'
      }

      ul(class: 'pagination-list') {
        @pages&.each do |page|
          li {
            if page == :ellipsis
              span(class: 'pagination-ellipsis') {
                plain '&hellip;'.html_safe
              }
            else
              a(
                aria: {
                  current: page[:number] == @current_page ? 'page' : nil,
                  label: "go to page #{page[:number]}"
                },
                **classes('pagination-link', page[:number] == @current_page ? 'is-current' : nil),
                href: page[:href]
              ) {
                page[:number]
              }
            end
          }
        end
      }
    }
  end

  private

  def first_page? = @current_page == pages.first[:number]

  def last_page? = @current_page == pages.last[:number]

  def position? = @position.present?
end
