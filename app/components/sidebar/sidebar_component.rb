class SidebarComponent < ViewComponent::Base
  attr_reader :title

  def initialize(title:, background_color: 'hsl(200, 10%, 90%)')
    @styles = []

    @styles << "--sidebar-background-color: #{background_color}"
    @title = title
  end

  def style_string
    raw "style=\"#{@styles.join('; ')}\""
  end
end
