module Shared::HasRatio
  VALID_RATIOS = %w[
    square
    1by1
    5by4
    4by3
    3by2
    5by3
    16by9
    2by1
    3by1
    4by5
    3by4
    2by3
    3by5
    9by16
    1by2
    1by3
  ].freeze

  def self.included(base)
    base.attribute :ratio, :string
  end

  def initialize(**kwargs)
    super
    add_classes(ratio?: "has-ratio is-#{ratio}")
  end

  private

  def ratio? = VALID_RATIOS.include?(ratio)
end
