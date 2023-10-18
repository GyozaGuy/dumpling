class ProgressBar < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attribute :max, :integer, default: 100
  attribute :value, :integer

  def template
    progress(
      **compiled_classes('progress'),
      max: max,
      value: value
    )
  end
end
