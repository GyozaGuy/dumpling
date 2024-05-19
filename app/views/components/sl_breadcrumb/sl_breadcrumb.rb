class SlBreadcrumb < ApplicationComponent
  attribute :separator
  register_element :sl_breadcrumb
  register_element :sl_breadcrumb_item

  def item(href: nil, prefix: nil, suffix: nil)
    sl_breadcrumb_item(data_component: true, href:) {
      sl_icon(name: prefix, slot: 'prefix') if prefix
      yield
      sl_icon(name: suffix, slot: 'suffix') if suffix
    }
  end

  def view_template
    sl_breadcrumb(**default_attributes) {
      sl_icon(name: separator, slot: 'separator') if separator
      yield
    }
  end
end
