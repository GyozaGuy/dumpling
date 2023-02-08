class TabsComponent < ViewComponent::Base
  attr_reader :selected_index

  renders_many :tabs,
    lambda { |attrs, &block|
      { attrs:, block:, component_class: TabComponent }
    }

  def initialize(selected_index: 0)
    @selected_index = selected_index
  end

  class TabComponent < ViewComponent::Base
    attr_reader :index, :label, :selected

    def initialize(index:, label:, selected: false)
      @index = index
      @label = label
      @selected = selected
    end

    def selected?
      @selected == true
    end
  end
end
