module Shared::HasSize
  VALID_SIZES = %w[small normal medium large].freeze

  def self.included(base)
    base.attribute :size, :string
  end

  def size? = VALID_SIZES.include?(@size)
end
