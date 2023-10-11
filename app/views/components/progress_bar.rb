class ProgressBar < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attribute :max, :integer, default: 100
  attribute :value, :integer

  def template
    progress(
      **classes('progress', color?: "is-#{color}", size?: "is-#{@size}"),
      max: @max,
      value: @value
    )
  end
end
