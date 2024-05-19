class SlMenu < ApplicationComponent
  attribute :submenu, default: false
  register_element :sl_menu
  register_element :sl_menu_item
  register_element :sl_menu_label

  def item(
    checked: false,
    disabled: false,
    loading: false,
    prefix_icon: nil,
    suffix_icon: nil,
    type: nil,
    value: nil
  )
    # TODO: Handle prefix/suffix badges (maybe other types too?)
    sl_menu_item(checked:, data_component: true, disabled:, loading:, type:, value:) {
      sl_icon(name: prefix_icon, slot: 'prefix') if prefix_icon
      yield
      sl_icon(name: suffix_icon, slot: 'suffix') if suffix_icon
    }
  end

  def label(&block)
    sl_menu_label(&block)
  end

  def view_template(&block)
    sl_menu(**default_attributes, slot: submenu ? 'submenu' : nil, &block)
  end
end
