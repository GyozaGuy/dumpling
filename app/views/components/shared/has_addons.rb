module Shared::HasAddons
  def self.included(base)
    base.attribute :addons, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(addons?: 'has-addons')
  end

  private

  def addons? = addons == true
end
