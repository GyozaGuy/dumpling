class SlButton < ApplicationComponent
  attribute :action
  attribute :caret, default: false
  attribute :circle, default: false
  attribute :disabled, default: false
  attribute :href
  attribute :loading, default: false
  attribute :method, default: nil, one_of: [nil, :delete, :get, :patch, :post, :put]
  attribute :outline, default: false
  attribute :pill, default: false
  attribute :prefix_icon
  attribute :size, default: :medium, one_of: %i[small medium large]
  attribute :slot
  attribute :suffix_icon
  attribute :target, default: nil, one_of: [nil, '_blank', '_parent', '_self', '_top']
  attribute :type
  attribute :variant,
    default: :default,
    one_of: %i[danger default neutral primary success text warning]
  register_element :sl_button

  def view_template(wrapped: false, &block)
    if href && method && !wrapped
      return form(action: href, method:) {
        template(wrapped: true, &block)
      }
    end

    sl_button(
      **default_attributes,
      caret:,
      circle:,
      data: {
        **data,
        action: "click->#{action}"
      },
      disabled:,
      href: method ? nil : href,
      loading:,
      outline:,
      pill:,
      size:,
      slot:,
      target:,
      type: method ? 'submit' : type,
      variant:
    ) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      yield
      sl_icon(name: suffix_icon, slot: 'suffix') if suffix_icon
    }
  end
end
