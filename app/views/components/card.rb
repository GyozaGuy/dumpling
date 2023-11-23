class Card < ApplicationComponent
  include Phlex::DeferredRender

  attribute :heading, :string
  attribute :image, :string
  attribute :image_alt, :string
  attribute :image_ratio, :string
  attribute :image_size, :string, default: '4by3'

  def template
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

      if @content
        div(class: 'card-content', data_card_target: 'content') {
          div(class: 'content', &@content)
        }
      end

      footer(class: 'card-footer', data_card_target: 'footer', &@footer) if @footer
    }
  end

  def action(href:, text:, method: nil)
    if method.present?
      button_to(text, href, class: 'card-footer-item', method:)
    else
      a(class: 'card-footer-item', href:) {
        text
      }
    end
  end

  def actions(&block)
    @footer = block
  end

  def content(&block)
    @content = block
  end

  private

  def heading? = heading.present?
  def image? = image.present?
  def image_size? = image_size.present?
end
