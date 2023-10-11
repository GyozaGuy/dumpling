module Shared::IsColor
  VALID_COLORS = %w[black danger dark info light link primary success warning white].freeze

  def self.included(base)
    base.attribute :color, :string
  end

  def initialize(**kwargs)
    super
    add_classes(color?: "is-#{color}")
  end

  private

  def color? = VALID_COLORS.include?(color)
end
