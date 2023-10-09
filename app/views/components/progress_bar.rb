class ProgressBar < ApplicationComponent
  attr_accessor :color, :max, :size, :value

  def initialize(*args)
    super
    @max ||= 100
  end

  def template
    progress(
      **classes('progress', colored?: "is-#{@color}", sized?: "is-#{@size}"),
      max: @max,
      value: @value
    )
  end

  private

  def colored? = @color.present?

  def sized? = @size.present?
end
