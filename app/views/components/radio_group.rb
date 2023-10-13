class RadioGroup < ApplicationComponent
  attribute :name, :string

  def radio(**kwargs, &block)
    d_radio(name: name, **kwargs, &block)
  end

  def template(&block)
    div(class: 'control', &block)
  end
end
