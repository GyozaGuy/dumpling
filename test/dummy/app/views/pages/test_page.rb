class TestPage < ApplicationComponent
  def template
    render Navbar.new(
      color: 'dark',
      left_items: [{ href: '/', label: 'Home' }, { href: test_path, label: 'Testing' }],
      right_items: [{ href: '/', label: 'Profile' }],
      shadow: true,
      spaced: true
    )

    render Container.new do
      render Section.new do
        render Breadcrumb.new items: [['First', '/'], ['Second', test_path]]
      end

      render Section.new do
        render Card.new actions: [['Save', ''], ['Edit', ''], ['Delete', '']], heading: 'Card' do
          'Hi there!'
        end
      end

      render Section.new do
        render Dropdown.new items: %w[One Two], label: 'Dropdown'
      end

      render Section.new do
        render Menu.new do |menu|
          menu.menu_section(
            items: [
              { href: '/', label: 'Home' },
              { active: true, href: test_path, label: 'Testing' }
            ],
            label: 'General'
          )
        end
      end

      render Section.new do
        render Message.new title: 'Message' do
          'Message content'
        end
      end

      render Modal.new title: 'Modal' do |modal|
        modal.modal_body do
          'Modal content'
        end

        modal.modal_footer do
          button(class: 'button is-primary') {
            'Click me'
          }
          button(class: 'button', data: { action: 'modal#close' }) {
            'Close'
          }
        end
      end

      render Section.new do
        render Pagination.new(
          current_page: 1,
          pages: [
            { href: '', number: 1 },
            { href: '', number: 2 },
            :ellipsis,
            { href: '', number: 10 }
          ]
        )
      end
    end
  end
end
