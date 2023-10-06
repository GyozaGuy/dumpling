class TestPage < ApplicationComponent
  def template
    render Container.new do
      render Section.new do
        render Breadcrumb.new items: [['First', '/'], ['Second', test_path]]
      end

      render Section.new do
        render Card.new actions: [['Save', ''], ['Edit', ''], ['Delete', '']], heading: 'Card' do
          plain 'Hi there!'
        end
      end
    end
  end
end
