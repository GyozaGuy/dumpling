module Shared::IsHoverable
  def self.included(base)
    base.attribute :hoverable, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(hoverable?: 'is-hoverable')
  end

  private

  def hoverable? = hoverable == true
end
