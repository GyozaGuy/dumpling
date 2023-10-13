class Hero < ApplicationComponent
  include Phlex::DeferredRender
  include Shared::IsColor
  include Shared::IsSize

  attribute :fixed_navbar, :boolean
  attribute :subtitle, :string
  attribute :title, :string

  def body(&block)
    @body = block
  end

  def foot(&block)
    @foot = block
  end

  def head(&block)
    @head = block
  end

  def template
    section(
      **class_list(
        'hero',
        full_height_with_fixed_navbar?: 'is-fullheight-with-navbar'
      )
    ) {
      div(class: 'hero-head', &@head) if @head

      div(class: 'hero-body') {
        if title
          div {
            d_title(size: 1, subtitle: subtitle, title: title)
          }
        elsif @body
          render @body
        end
      }

      div(class: 'hero-foot', &@foot) if @foot
    }
  end

  private

  def fixed_navbar? = fixed_navbar == true

  def full_height? = @size == 'fullheight'

  def full_height_with_fixed_navbar? = full_height? && fixed_navbar?

  def size? = VALID_SIZES.include?(@size) && !full_height_with_fixed_navbar?
end
