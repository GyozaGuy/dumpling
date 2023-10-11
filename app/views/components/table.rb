class Table < ApplicationComponent
  attribute :rows, array: true, default: []

  attr_accessor :border, :footer, :full_width, :headers, :hoverable, :narrow, :scrollable, :striped

  def row(values)
    @rows << tr(class: values[:selected] ? 'is-selected' : nil) {
      @headers.each_key do |key|
        td {
          values[key]
        }
      end
    }
  end

  def template(&block)
    if scrollable?
      div(class: 'table-container') {
        table_template(&block)
      }
    else
      table_template(&block)
    end
  end

  private

  def bordered? = @border == true

  def footer? = @footer == true

  def full_width? = @full_width == true

  def header_cells
    @headers.each_value do |header|
      th {
        header
      }
    end
  end

  def hoverable? = @hoverable == true

  def narrow? = @narrow == true

  def scrollable? = @scrollable == true

  def striped? = @striped == true

  def table_template(&block)
    table(
      **classes(
        'table',
        bordered?: 'is-bordered',
        full_width?: 'is-fullwidth',
        hoverable?: 'is-hoverable',
        narrow?: 'is-narrow',
        striped?: 'is-striped'
      )
    ) {
      thead {
        tr {
          header_cells
        }
      }

      tbody(&block)

      if footer?
        tfoot {
          tr {
            header_cells
          }
        }
      end
    }
  end
end
