class ProgressBar < ApplicationComponent
  include Shared::HasSize

  attribute :color, :string
  attribute :max, :integer, default: 100
  attribute :value, :integer

  def template
    progress(
      **classes('progress', colored?: "is-#{@color}", size?: "is-#{@size}"),
      max: @max,
      value: @value
    )
  end
end
