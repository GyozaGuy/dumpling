module Shared::AreSize
  VALID_SIZES = %w[small normal medium large].freeze

  def self.included(base)
    base.attribute :size, :string
  end

  def initialize(**kwargs)
    super
    add_classes(size?: "are-#{size}")
  end

  private

  def size? = VALID_SIZES.include?(size)
end
