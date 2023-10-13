class CheckboxGroup < ApplicationComponent
  attribute :name, :string

  def checkbox(**kwargs, &block)
    d_checkbox(name: name, **kwargs, &block)
  end

  def template(&block)
    div(class: 'control', &block)
  end
end
