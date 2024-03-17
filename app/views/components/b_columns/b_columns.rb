class BColumns < ApplicationComponent
  attribute :centered, default: false
  attribute :desktop, default: false
  attribute :gap, default: nil, one_of: [nil, 0, 1, 2, 3, 4, 5, 6, 7, 8]
  attribute :gapless, default: false
  attribute :mobile, default: false
  attribute :multiline, default: true
  attribute :vcentered, default: false

  def column(...) = b_column(...)

  def template(&block)
    div(
      **default_attributes,
      **classes(
        'columns',
        class_string,
        centered?: 'is-centered',
        desktop?: 'is-desktop',
        gap?: "is-#{gap}",
        gapless?: 'is-gapless',
        mobile?: 'is-mobile',
        multiline?: 'is-multiline',
        vcentered?: 'is-vcentered'
      ),
      &block
    )
  end
end
