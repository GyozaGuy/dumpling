class TestPage < ApplicationView
  def template
    d_navbar(
      color: 'dark',
      fixed: true,
      left_items: [{ href: '/', label: 'Home' }, { href: test_path, label: 'Testing' }],
      right_items: [{ href: '/', label: 'Profile' }]
    )

    d_hero(color: 'info', subtitle: 'Now with Bulma', title: 'Dumpling') { |hero|
      hero.head {
        'Hero header!'
      }
      hero.foot {
        'Hero footer!'
      }
    }

    d_container {
      d_section {
        d_title(subtitle: 'For navigation', title: 'Breadcrumbs')
        d_breadcrumbs items: [['First', '/'], ['Second', test_path]]
      }

      d_section {
        d_card(actions: [['Save', ''], ['Edit', ''], ['Delete', '']], heading: 'Card') {
          'Hi there!'
        }
      }

      d_section {
        d_dropdown items: %w[One Two], label: 'Dropdown'
      }

      d_section {
        d_menu { |menu|
          menu.menu_section(
            items: [
              { href: '/', label: 'Home' },
              { active: true, href: test_path, label: 'Testing' }
            ],
            label: 'General'
          )
        }
      }

      d_section {
        d_message(title: 'Message') {
          'Message content'
        }
      }

      d_section {
        d_notification(color: 'info', light: true) {
          'Notification!'
        }
      }

      d_modal(title: 'Modal') { |modal|
        modal.modal_body {
          'Modal content'
        }

        modal.modal_footer {
          button(class: 'button is-primary') {
            'Click me'
          }
          button(class: 'button', data: { action: 'modal#close' }) {
            'Close'
          }
        }
      }

      d_section {
        d_pagination(
          current_page: 1,
          pages: [
            { href: '', number: 1 },
            { href: '', number: 2 },
            :ellipsis,
            { href: '', number: 10 }
          ]
        )
      }

      d_section {
        d_box {
          d_button text: 'Button'
          d_button color: 'link', href: test_path, text: 'Link'
        }

        d_box {
          d_button_group(addons: true) {
            d_button color: 'primary', selected: true, text: 'Button'
            d_button text: 'Button'
          }
        }
      }

      d_section {
        d_progress_bar(color: 'info', value: 25)
      }

      d_section {
        d_box {
          d_block {
            'This is text.'
          }
          d_block {
            'This is also text.'
          }
        }
      }

      d_section {
        d_content(size: 'medium') {
          'This is medium content!'
        }
      }

      d_section {
        d_table(
          border: true,
          full_width: true,
          headers: {
            first: 'First',
            second: 'Second',
            third: 'Third',
            fourth: 'Fourth',
            fifth: 'Fifth'
          },
          hoverable: true,
          scrollable: true,
          striped: true
        ) { |table|
          table.row(
            first: 'Value 1',
            second: 'Value 2',
            third: 'Value 3',
            fourth: 'Value 4',
            fifth: 'Value 5'
          )
          table.row(first: 'Value 1', second: 'Value 2', selected: true, third: 'Value 3')
          table.row(first: 'Value 1', second: 'Value 2', third: 'Value 3')
          table.row(first: 'Value 1', second: 'Value 2', third: 'Value 3')
          table.row(first: 'Value 1', second: 'Value 2', third: 'Value 3')
        }
      }

      d_section {
        d_tag_list(addons: true, size: 'medium') {
          d_tag(
            color: 'info',
            delete_action: 'close',
            light: true,
            rounded: true,
            text: 'Hi'
          )
          d_tag(
            color: 'primary',
            delete_action: 'close',
            light: true,
            text: 'Hello'
          )
          d_tag(
            color: 'success',
            delete_action: 'close',
            text: 'Hola'
          )
          d_tag(
            color: 'link',
            href: 'https://google.com',
            target: '_blank',
            text: 'Google'
          )
        }
      }

      d_section {
        d_column_group(centered: true, vcentered: true) { |columns|
          columns.column(columns: 2) {
            d_box {
              'First column'
            }
          }
          columns.column(columns: 2) {
            'Second column'
          }
          columns.column(columns: 2) {
            'Third column'
          }
        }
      }

      d_section {
        d_level { |level|
          level.item {
            'Item 1!'
          }
          level.item {
            'Item 2!'
          }
        }
      }

      d_section {
        d_box {
          d_media_object { |obj|
            obj.content {
              'Content!'
            }
            obj.right {
              'Right content'
            }
          }
        }
      }

      d_section {
        d_tile {
          'hi'
        }
      }
    }

    d_footer {
      d_content(centered: true, size: 'small') {
        'Copyright &copy; 2023 - All rights reserved'.html_safe
      }
    }
  end
end
