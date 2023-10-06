class TestPage < ApplicationComponent
  def template
    render Breadcrumb.new items: [['First', '/'], ['Second', test_path]]
    render Card.new actions: [['Save', ''], ['Edit', ''], ['Delete', '']], heading: 'Card' do
      plain 'Hi there!'
    end
  end
end
