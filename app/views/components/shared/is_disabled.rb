module Shared::IsDisabled
  def self.included(base)
    base.attribute :disabled, :boolean
  end

  def initialize(**kwargs)
    super
    add_props(disabled: disabled? ? '' : nil)
  end

  private

  def disabled? = disabled == true
end
