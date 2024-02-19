class SlTabGroup < ApplicationComponent
  attribute :activation, default: :auto, one_of: %i[auto manual]
  attribute :placement, default: :top, one_of: %i[bottom end start top]
  register_element :sl_tab
  register_element :sl_tab_group
  register_element :sl_tab_panel

  def panel(name:, &block)
    sl_tab_panel(data_component: true, name:, &block)
  end

  def tab(panel:, closable: false, data: {}, disabled: false, &block)
    sl_tab(closable:, data: { component: true, **data }, disabled:, panel:, slot: 'nav', &block)
  end

  def template(&block)
    sl_tab_group(**default_attributes, activation:, placement:, &block)
  end
end
