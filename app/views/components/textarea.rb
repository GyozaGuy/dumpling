class Textarea < ApplicationComponent
  include Shared::HasSize

  attr_accessor :color, :disabled, :fixed_size, :loading, :placeholder, :readonly, :rows

  def template(&block)
    div(**classes('control', loading?: 'is-loading')) {
      textarea(
        **classes(
          'textarea',
          colored?: "is-#{@color}",
          fixed_size?: 'has-fixed-size',
          size?: "is-#{@size}"
        ),
        disabled: @disabled ? '' : nil,
        placeholder: @placeholder,
        readonly: @readonly ? '' : nil,
        rows: @rows,
        &block
      )
    }
  end

  private

  def colored? = @color.present?

  def fixed_size? = @fixed_size == true

  def loading? = @loading == true
end
