VALID_INPUT_TYPES = %w[email date number password tel text time].freeze

class Input < ApplicationComponent
  include Shared::IsColor
  include Shared::IsRounded
  include Shared::IsSize

  # TODO: finish icons
  attribute :disabled, :boolean
  attribute :left_icon, :string
  attribute :loading, :boolean
  attribute :placeholder, :string
  attribute :readonly, :boolean
  attribute :right_icon, :string
  attribute :static, :boolean
  attribute :type, :string, default: 'text'
  attribute :value

  def template
    raise "Invalid input type: #{type}" unless VALID_INPUT_TYPES.include?(type)

    div(**classes('control', loading?: 'is-loading')) {
      input(
        **class_list(
          'input',
          static?: 'is-static'
        ),
        disabled: disabled ? '' : nil,
        placeholder: placeholder,
        readonly: readonly ? '' : nil,
        type: type,
        value: value
      )
    }
  end

  private

  def loading? = loading == true

  def static? = static == true
end
