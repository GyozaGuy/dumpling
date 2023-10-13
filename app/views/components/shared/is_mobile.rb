module Shared::IsMobile
  def self.included(base)
    base.attribute :mobile, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(mobile?: 'is-mobile')
  end

  private

  def mobile? = mobile == true
end
