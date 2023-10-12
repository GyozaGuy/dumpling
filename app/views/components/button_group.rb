class ButtonGroup < ApplicationComponent
  include Shared::HasAddons

  attribute :position, :string

  def template(&block)
    div(**class_list('buttons', position?: "is-#{position}"), &block)
  end

  private

  def position? = position.present?
end
