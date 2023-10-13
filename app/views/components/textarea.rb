class Textarea < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attribute :disabled, :boolean
  attribute :fixed_size, :boolean
  # TODO: figure out how to get loading to be more DRY
  attribute :loading, :boolean
  attribute :placeholder, :string
  attribute :readonly, :boolean
  attribute :rows, :integer

  def template(&block)
    div(**classes('control', loading?: 'is-loading')) {
      textarea(
        **class_list(
          'textarea',
          fixed_size?: 'has-fixed-size'
        ),
        disabled: disabled ? '' : nil,
        placeholder: placeholder,
        readonly: readonly ? '' : nil,
        rows: rows,
        &block
      )
    }
  end

  private

  def fixed_size? = fixed_size == true

  def loading? = loading == true
end
