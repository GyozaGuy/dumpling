module Shared::IsColor
  VALID_COLORS = %w[black danger dark info light link primary success warning white].freeze

  def self.included(base)
    base.attribute :color, :string
  end

  private

  def color? = VALID_COLORS.include?(color)
end
