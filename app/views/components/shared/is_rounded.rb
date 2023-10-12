module Shared::IsRounded
  def self.included(base)
    base.attribute :rounded, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(rounded?: 'is-rounded')
  end

  private

  def rounded? = rounded == true
end
