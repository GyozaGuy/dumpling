class SlSelect < ApplicationComponent
  attribute :clearable, default: false
  attribute :disabled, default: false
  attribute :filled, default: false
  attribute :help_text
  attribute :label
  attribute :multiple, default: false
  attribute :name
  attribute :pill, default: false
  attribute :placeholder
  attribute :placement, default: :bottom, one_of: %i[bottom top]
  attribute :prefix_icon
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :value
  register_element :sl_option
  register_element :sl_select

  def option(value:, disabled: false, prefix_icon: nil, suffix_icon: nil)
    sl_option(disabled:, value:) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      yield
      sl_icon(name: suffix_icon, slot: 'suffix') if suffix_icon
    }
  end

  def template
    sl_select(
      **default_attributes,
      clearable:,
      disabled:,
      filled:,
      help_text:,
      label:,
      multiple:,
      name:,
      pill:,
      placeholder:,
      placement:,
      size:,
      value:
    ) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      yield
    }
  end
end
