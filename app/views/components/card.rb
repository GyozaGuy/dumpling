class Card < ApplicationComponent
  attribute :actions, array: true
  attribute :heading, :string
  attribute :image, :string
  attribute :image_alt, :string
  attribute :image_ratio, :string
  attribute :image_size, :string, default: '4by3'

  def template(&block)
    div(class: 'card', data_controller: 'card') {
      if heading?
        header(class: 'card-header') {
          p(class: 'card-header-title') {
            heading
          }

          button(aria_label: 'toggle', class: 'card-header-icon', data_action: 'card#toggle') {
            span(class: 'icon') {
              image_tag('dumpling/icons/chevron_down', aria_hidden: true)
            }
          }
        }
      end

      if image?
        div(class: 'card-image') {
          d_image(alt: image_alt, ratio: image_ratio, size: image_size, src: image)
        }
      end

      div(class: 'card-content', data_card_target: 'content') {
        div(class: 'content', &block)
      }

      if actions?
        footer(class: 'card-footer', data_card_target: 'footer') {
          actions.each do |text, href|
            a(class: 'card-footer-item', href:) {
              text
            }
          end
        }
      end
    }
  end

  private

  def actions? = actions.present?

  def heading? = heading.present?

  def image? = image.present?

  def image_size? = image_size.present?
end
