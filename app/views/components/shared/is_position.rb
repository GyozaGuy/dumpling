VALID_POSITIONS = %w[centered right].freeze

module Shared::IsPosition
  def self.included(base)
    base.attribute :position, :string
  end

  def initialize(**kwargs)
    super
    add_classes(position?: "is-#{position}")
  end

  private

  def position? = VALID_POSITIONS.include?(position)
end
