class SlProgressBar < ApplicationComponent
  attribute :height
  attribute :indeterminate, default: false
  attribute :label
  attribute :value
  register_element :sl_progress_bar

  def view_template(&block)
    sl_progress_bar(
      **default_attributes, indeterminate:, label:, style: style_string, value:,
      &block
    )
  end

  private

  def style_string
    style_strings = []
    style_strings << "--height: #{height};" if height

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
