module Shared::IsLight
  def self.included(base)
    base.attribute :light, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(light?: 'is-light')
  end

  private

  def light? = light == true
end
