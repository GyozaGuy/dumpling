class SlTextarea < ApplicationComponent
  attribute :disabled, default: false
  attribute :filled, default: false
  attribute :help_text
  attribute :label
  attribute :name
  attribute :placeholder
  attribute :readonly, default: false
  attribute :required, default: false
  attribute :resize, default: :vertical, one_of: %i[auto none vertical]
  attribute :rows
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :value
  register_element :sl_textarea

  def view_template
    sl_textarea(
      **default_attributes,
      disabled:,
      filled:,
      help_text:,
      label:,
      name:,
      placeholder:,
      readonly:,
      required:,
      resize:,
      rows:,
      size:,
      value:
    )
  end
end
