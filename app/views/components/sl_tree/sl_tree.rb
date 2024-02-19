class SlTree < ApplicationComponent
  attribute :collapse_icon
  attribute :expand_icon
  attribute :indent_guide_color
  attribute :indent_guide_offset
  attribute :indent_guide_style # Valid values: dashed, dotted, solid
  attribute :indent_guide_width
  attribute :selection, default: :single, one_of: %i[leaf multiple single]
  register_element :sl_tree
  register_element :sl_tree_item

  def item(expanded: false, icon: nil, lazy: false, selected: false)
    sl_tree_item(data_component: true, expanded:, lazy:, selected:) {
      sl_icon(name: icon) if icon
      yield
    }
  end

  def template
    sl_tree(**default_attributes, selection:, style: style_string) {
      sl_icon(name: collapse_icon, slot: 'collapse-icon') if collapse_icon
      sl_icon(name: expand_icon, slot: 'expand-icon') if expand_icon
      yield
    }
  end

  private

  def style_string
    style_strings = []
    style_strings << "--indent-guide-color: #{indent_guide_color};" if indent_guide_color
    style_strings << "--indent-guide-offset: #{indent_guide_offset};" if indent_guide_offset
    style_strings << "--indent-guide-style: #{indent_guide_style};" if indent_guide_style
    style_strings << "--indent-guide-width: #{indent_guide_width};" if indent_guide_width

    [style, style_strings.join(' ')].compact.join('; ')
  end
end
