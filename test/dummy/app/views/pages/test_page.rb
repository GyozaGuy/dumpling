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
        render Dropdown.new items: ['One', :divider, 'Two'], text: 'hi'
      end
    end
  end
end
