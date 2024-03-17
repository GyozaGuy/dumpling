class BColumn < ApplicationComponent
  attribute :narrow, default: false
  attribute :size,
    default: nil,
    one_of: [
      nil,
      :three_quarters,
      :two_thirds,
      :half,
      :one_third,
      :one_quarter,
      :full,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12
    ]

  def template(&block)
    div(
      **default_attributes, **classes(
        'column',
        class_string,
        narrow?: 'is-narrow',
        size?: "is-#{to_dash(size)}"
      ),
      &block
    )
  end
end
