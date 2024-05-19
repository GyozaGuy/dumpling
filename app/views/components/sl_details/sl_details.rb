class SlDetails < ApplicationComponent
  attribute :collapse_icon
  attribute :disabled, default: false
  attribute :expand_icon
  attribute :open, default: false
  attribute :summary, required: true
  register_element :sl_details

  def view_template
    sl_details(**default_attributes, disabled:, open:, summary:) {
      sl_icon(name: collapse_icon, slot: 'collapse-icon') if collapse_icon
      sl_icon(name: expand_icon, slot: 'expand-icon') if expand_icon
      yield
    }
  end
end
