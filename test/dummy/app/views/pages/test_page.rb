class TestPage < ApplicationView
  def template
    d_navbar(
      color: 'dark',
      fixed: true,
      left_items: [{ href: '/', label: 'Home' }, { href: test_path, label: 'Testing' }],
      right_items: [{ href: '/', label: 'Profile' }],
      shadow: true,
      spaced: true
    )

    d_container {
      d_section {
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
    }
  end
end
