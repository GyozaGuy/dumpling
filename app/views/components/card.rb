class Card < ApplicationComponent
  attr_accessor :actions, :heading, :image, :image_alt

  def template(&block)
    div(class: 'card') {
      if heading?
        header(class: 'card-header') {
          p(class: 'card-header-title') {
            @heading
          }

          button(aria_label: 'toggle', class: 'card-header-icon') {
            span(class: 'icon') {
              image_tag('dumpling/icons/chevron_down', aria_hidden: true)
            }
          }
        }
      end

      if image?
        div(class: 'card-image') {
          figure(class: 'image is-4by3') {
            img(alt: @image_alt, src: @image)
          }
        }
      end

      div(class: 'card-content') {
        div(class: 'content', &block)
      }

      if actions?
        footer(class: 'card-footer') {
          @actions.each do |text, href|
            a(class: 'card-footer-item', href: href) {
              text
            }
          end
        }
      end
    }
  end

  private

  def actions?
    @actions.present?
  end

  def heading?
    @heading.present?
  end

  def image?
    @image.present?
  end
end
