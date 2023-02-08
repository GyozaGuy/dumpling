class TabsComponent < ViewComponent::Base
  attr_reader :selected_index, :tabs_id

  renders_many :tabs,
    lambda { |attrs, &block|
      { attrs:, block:, component_class: TabComponent, tabs_id: }
    }

  def initialize(selected_index: 0)
    @selected_index = selected_index
    @tabs_id = SecureRandom.uuid
  end

  class TabComponent < ViewComponent::Base
    attr_reader :index, :label, :selected, :tabs_id

    def initialize(index:, label:, tabs_id:, selected: false)
      @index = index
      @label = label
      @selected = selected
      @tabs_id = tabs_id
    end

    def selected?
      selected == true
    end
  end
end
