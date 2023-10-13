class ProgressBar < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attribute :max, :integer, default: 100
  attribute :value, :integer

  def template
    progress(
      **class_list('progress'),
      max: max,
      value: value
    )
  end
end
