VALID_IMAGE_SIZES = %w[16x16 24x24 32x32 48x48 64x64 96x96 128x128].freeze

class Image < ApplicationComponent
  include Shared::HasRatio
  include Shared::IsRounded

  attribute :alt, :string
  attribute :size, :string
  attribute :src, :string

  def template
    # TODO: figure out how to avoid certain things being auto-added while staying DRY (e.g. ratio)
    figure(**classes('image', ratio?: "is-#{ratio}", size?: "is-#{size}")) {
      img(alt: alt, **class_list, src: src)
    }
  end

  private

  def size? = VALID_IMAGE_SIZES.include?(size)
end
