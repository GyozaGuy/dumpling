class Card < ApplicationComponent
  attr_accessor :actions, :heading, :icon, :icon_label, :image, :image_alt

  def template(&block)
    div(class: 'card') {
      if heading?
        header(class: 'card-header') {
          p(class: 'card-header-title') {
            @heading
          }

          if icon?
            button(aria_label: @icon_label, class: 'card-header-icon') {
              span(class: 'icon') {
                @icon
              }
            }
          end
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

  def icon?
    @icon.present?
  end

  def image?
    @image.present?
  end
end
