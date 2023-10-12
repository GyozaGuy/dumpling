class TagList < ApplicationComponent
  include Shared::AreSize
  include Shared::HasAddons

  def template(&block)
    div(**class_list('tags'), &block)
  end
end
