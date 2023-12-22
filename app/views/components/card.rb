class Card < ApplicationComponent
  include Phlex::DeferredRender

  attribute :collapsible, :boolean, default: false
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

          if collapsible?
            button(aria_label: 'toggle', class: 'card-header-icon', data_action: 'card#toggle') {
              span(class: 'icon') {
                image_tag('dumpling/icons/chevron_down', aria_hidden: true)
              }
            }
          end
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

  def action(text:, action: nil, data: {}, disabled: false, href: nil, method: nil)
    if href.present? && method.nil?
      a(**classes('card-footer-item', disabled ? 'is-disabled' : nil), data:, href:) {
        text
      }
    elsif href.nil? && method.nil?
      button(class: 'card-footer-item', data: { **data, action: }, disabled:) {
        text
      }
    else
      button_to(text, href, class: 'card-footer-item', data:, disabled:, method:)
    end
  end

  def actions(&block)
    @footer = block
  end

  def content(&block)
    @content = block
  end

  private

  def collapsible? = collapsible == true
  def heading? = heading.present?
  def image? = image.present?
  def image_size? = image_size.present?
end
