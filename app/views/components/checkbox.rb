class Checkbox < ApplicationComponent
  attribute :checked, :boolean
  attribute :disabled, :boolean
  attribute :label_text, :string
  attribute :name, :string

  def template
    label(class: 'checkbox', disabled: disabled) {
      input(checked: checked, disabled: disabled, name: name, type: 'checkbox')
      plain "&nbsp;#{label_text}".html_safe
    }
  end
end
