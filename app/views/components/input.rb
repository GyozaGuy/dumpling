VALID_INPUT_TYPES = %w[email date number password tel text time].freeze

class Input < ApplicationComponent
  include Shared::IsColor
  include Shared::IsRounded
  include Shared::IsSize

  # TODO: finish icons
  attribute :action, :string
  attribute :control_id, :string
  attribute :disabled, :boolean
  attribute :left_icon, :string
  attribute :loading, :boolean
  attribute :name, :string
  attribute :placeholder, :string
  attribute :readonly, :boolean
  attribute :right_icon, :string
  attribute :static, :boolean
  attribute :type, :string, default: 'text'
  attribute :value

  def template
    raise "Invalid input type: #{type}" unless VALID_INPUT_TYPES.include?(type)

    div(**classes('control', loading?: 'is-loading'), id: control_id) {
      input(
        **props,
        **compiled_classes(
          'input',
          static?: 'is-static'
        ),
        data_action: action? ? action : nil,
        disabled: disabled ? '' : nil,
        name:,
        placeholder:,
        readonly: readonly ? '' : nil,
        type:,
        value:
      )
    }
  end

  private

  def action? = action.present?
  def loading? = loading == true
  def static? = static == true
end
