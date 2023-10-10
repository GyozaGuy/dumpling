class Select < ApplicationComponent
  attr_accessor :color, :fullwidth, :multiple, :rounded, :rows, :size

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
          fullwidth?: 'is-fullwidth',
          multiple?: 'is-multiple',
          rounded?: 'is-rounded',
          sized?: "is-#{@size}"
        )
      ) {
        select(multiple: multiple? ? '' : nil, size: @rows, &block)
      }
    }
  end

  private

  def colored? = @color.present?

  def fullwidth? = @fullwidth == true

  def multiple? = @multiple == true

  def rounded? = @rounded == true

  def sized? = @size.present?
end
