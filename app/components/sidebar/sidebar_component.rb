class SidebarComponent < Dumpling::Component
  attr_reader :title

  def initialize(background_color: 'hsl(200, 10%, 90%)', title: nil)
    styles << "--sidebar-background-color: #{background_color}"
    @title = title
  end
end
