class ColumnGroup < ApplicationComponent
  attr_accessor :centered, :desktop, :gap, :gapless, :mobile, :multiline, :vcentered

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
      **classes(
        'columns',
        centered?: 'is-centered',
        desktop?: 'is-desktop',
        gap?: "is-variable is-#{@gap}",
        gapless?: 'is-gapless',
        mobile?: 'is-mobile',
        multiline?: 'is-multiline',
        vcentered?: 'is-vcentered'
      ),
      &block
    )
  end

  private

  def centered? = @centered == true

  def desktop? = @desktop == true

  def gap? = @gap.present?

  def gapless? = @gapless == true

  def mobile? = @mobile == true

  def multiline? = @multiline == true

  def vcentered? = @vcentered = true
end
