class SlTabGroup < ApplicationComponent
  attribute :activation, default: :auto, one_of: %i[auto manual]
  attribute :placement, default: :top, one_of: %i[bottom end start top]
  register_element :sl_tab
  register_element :sl_tab_group
  register_element :sl_tab_panel

  def panel(name:, &block)
    sl_tab_panel(data_component: true, name:, &block)
  end

  def tab(*args, panel:, active: false, closable: false, data: {}, disabled: false, &block)
    active = args.include?(:active) || active
    sl_tab(
      active:, closable:, data: { component: true, **data }, disabled:, panel:, slot: 'nav',
      &block
    )
  end

  def view_template(&block)
    sl_tab_group(**default_attributes, activation:, placement:, &block)
  end
end
