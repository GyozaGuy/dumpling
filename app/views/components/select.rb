class Select < ApplicationComponent
  include Shared::IsColor
  include Shared::IsRounded
  include Shared::IsSize

  attribute :full_width, :boolean
  attribute :multiple, :boolean
  attribute :rows, :integer

  def select_option(label:, value:)
    option(value: value) {
      label
    }
  end

  def template(&block)
    div(class: 'control') {
      div(
        **compiled_classes(
          'select',
          full_width?: 'is-fullwidth',
          multiple?: 'is-multiple'
        )
      ) {
        select(multiple: multiple? ? '' : nil, size: rows, &block)
      }
    }
  end

  private

  def full_width? = full_width == true

  def multiple? = multiple == true
end
