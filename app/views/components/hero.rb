class Hero < ApplicationComponent
  include Phlex::DeferredRender

  attr_accessor :color, :fixed_navbar, :size, :subtitle, :title

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
      **classes(
        'hero',
        colored?: "is-#{@color}",
        full_height_with_fixed_navbar?: 'is-fullheight-with-navbar',
        sized?: "is-#{@size}"
      )
    ) {
      div(class: 'hero-head', &@head) if @head

      div(class: 'hero-body') {
        if @title
          div {
            d_title(size: 1, subtitle: @subtitle, title: @title)
          }
        elsif @body
          render @body
        end
      }

      div(class: 'hero-foot', &@foot) if @foot
    }
  end

  private

  def colored? = @color.present?

  def fixed_navbar? = @fixed_navbar == true

  def full_height? = @size == 'fullheight'

  def full_height_with_fixed_navbar? = full_height? && fixed_navbar?

  def sized? = @size.present? && !full_height_with_fixed_navbar?
end
