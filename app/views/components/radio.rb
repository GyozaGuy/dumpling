class Radio < ApplicationComponent
  attribute :checked, :boolean
  attribute :disabled, :boolean
  attribute :label_text, :string
  attribute :name, :string

  def template
    label(class: 'radio', disabled: disabled) {
      input(checked: checked, disabled: disabled, name: name, type: 'radio')
      plain "&nbsp;#{label_text}".html_safe
    }
  end
end
