module Shared::IsSize
  VALID_SIZES = %w[small normal medium large].freeze

  def self.included(base)
    base.attribute :size, :string
  end

  def initialize(**kwargs)
    super
    add_classes(size?: "is-#{size}")
  end

  private

  def size? = VALID_SIZES.include?(size)
end
