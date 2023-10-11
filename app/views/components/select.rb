class Select < ApplicationComponent
  include Shared::HasSize

  attribute :color, :string
  attribute :full_width, :boolean
  attribute :multiple, :boolean
  attribute :rounded, :boolean
  attribute :rows, :integer

  def select_option(label:, value:)
    option(value: value) {
      label
    }
  end

  def template(&block)
    div(class: 'control') {
      div(
        **classes(
          'select',
          colored?: "is-#{@color}",
          full_width?: 'is-fullwidth',
          multiple?: 'is-multiple',
          rounded?: 'is-rounded',
          size?: "is-#{@size}"
        )
      ) {
        select(multiple: multiple? ? '' : nil, size: @rows, &block)
      }
    }
  end

  private

  def full_width? = @full_width == true

  def multiple? = @multiple == true

  def rounded? = @rounded == true
end
