module Shared::HasTextCentered
  def self.included(base)
    base.attribute :text_centered, :boolean
  end

  def initialize(**kwargs)
    super
    add_classes(text_centered?: 'has-text-centered')
  end

  private

  def text_centered? = text_centered == true
end
