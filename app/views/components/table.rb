class Table < ApplicationComponent
  include Shared::IsHoverable

  attribute :border, :boolean
  attribute :footer, :boolean
  attribute :full_width, :boolean
  attribute :headers, array: true
  attribute :narrow, :boolean
  attribute :rows, array: true, default: []
  attribute :scrollable, :boolean
  attribute :striped, :boolean

  def row(values)
    rows << tr(class: values[:selected] ? 'is-selected' : nil) {
      headers.each_key do |key|
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

  def border? = border == true

  def footer? = footer == true

  def full_width? = full_width == true

  def header_cells
    headers.each_value do |header|
      th {
        header
      }
    end
  end

  def narrow? = narrow == true

  def scrollable? = scrollable == true

  def striped? = striped == true

  def table_template(&block)
    table(
      **class_list(
        'table',
        border?: 'is-bordered',
        full_width?: 'is-fullwidth',
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
