class MediaObject < ApplicationComponent
  include Phlex::DeferredRender

  attribute :image, :string
  attribute :image_alt, :string

  def content(&block)
    @content = block
  end

  def right(&block)
    @right = block
  end

  def template
    article(class: 'media') {
      figure(class: 'media-left') {
        p(class: 'image is-64x64') {
          img(alt: image_alt, src: image)
        }
      }

      div(class: 'media-content', &@content) if @content

      div(class: 'media-right', &@right) if @right
    }
  end
end
