class SlInput < ApplicationComponent
  attribute :autocapitalize, default: :off, one_of: %i[off none on sentences words characters]
  attribute :autocomplete, default: nil, one_of: [nil, :off]
  attribute :autocorrect, default: :off, one_of: %i[off on]
  attribute :autofocus, default: false
  attribute :clearable, default: false
  attribute :disabled, default: false
  attribute :filled, default: false
  attribute :help_text
  attribute :inputmode, default: :none, one_of: %i[none text decimal numeric tel search email url]
  attribute :label
  attribute :max
  attribute :max_length
  attribute :min
  attribute :min_length
  attribute :name
  attribute :no_spin_buttons, default: false
  attribute :password_toggle, default: false
  attribute :pattern
  attribute :pill, default: false
  attribute :placeholder
  attribute :prefix_icon
  attribute :readonly, default: false
  attribute :required, default: false
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :spellcheck, default: false
  attribute :step
  attribute :suffix_icon
  attribute :type,
    default: :text,
    one_of: %i[date datetime_local email number password search tel text time url]
  attribute :value
  register_element :sl_input

  def template
    sl_input(
      **default_attributes,
      autocapitalize:,
      autocomplete:,
      autocorrect:,
      autofocus:,
      clearable:,
      disabled:,
      filled:,
      help_text:,
      label:,
      max:,
      max_length:,
      min:,
      min_length:,
      name:,
      no_spin_buttons:,
      password_toggle:,
      pattern:,
      pill:,
      placeholder:,
      readonly:,
      required:,
      size:,
      spellcheck:,
      step:,
      type: to_dash(type),
      value:
    ) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      sl_icon(name: suffix_icon, slot: 'suffix') if suffix_icon
    }
  end
end
