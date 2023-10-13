module Shared::IsActive
  def self.included(base)
    base.attribute :active, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(active?: 'is-active')
  end

  private

  def active? = active == true
end
