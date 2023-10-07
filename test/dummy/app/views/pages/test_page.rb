class TestPage < ApplicationComponent
  def template
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
        render Dropdown.new items: ['One', :divider, 'Two'], label: 'Dropdown'
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

      render Section.new do
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
      end
    end
  end
end
