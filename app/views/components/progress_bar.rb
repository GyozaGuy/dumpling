class ProgressBar < ApplicationComponent
  attribute :color, :string
  attribute :max, :integer, default: 100
  attribute :size, :string
  attribute :value, :integer

  def template
    progress(
      **classes('progress', colored?: "is-#{@color}", sized?: "is-#{@size}"),
      max: @max,
      value: @value
    )
  end
end
