class ColumnGroup < ApplicationComponent
  include Shared::IsMobile

  attribute :centered, :boolean
  attribute :desktop, :boolean
  attribute :gap, :integer, default: 3
  attribute :gapless, :boolean
  attribute :multiline, :boolean
  attribute :vcentered, :boolean

  # TODO: handle breakpoint sizes (for gaps too)
  def column(columns: nil, narrow: nil, offset: nil, size: nil, &block)
    if narrow.present?
      narrow_value = narrow == true ? 'narrow' : "narrow is-narrow-#{narrow}"
    end

    div(
      class: [
        'column',
        columns ? "is-#{columns}" : nil,
        narrow_value ? "is-#{narrow_value}" : nil,
        offset ? "is-offset-#{offset}" : nil,
        size ? "is-#{size}" : nil
      ],
      &block
    )
  end

  def template(&block)
    div(
      **class_list(
        'columns',
        centered?: 'is-centered',
        desktop?: 'is-desktop',
        gap?: "is-variable is-#{gap}",
        gapless?: 'is-gapless',
        multiline?: 'is-multiline',
        vcentered?: 'is-vcentered'
      ),
      &block
    )
  end

  private

  def centered? = centered == true

  def desktop? = desktop == true

  def gap? = gap.between?(0, 8)

  def gapless? = gapless == true

  def multiline? = multiline == true

  def vcentered? = vcentered == true
end
