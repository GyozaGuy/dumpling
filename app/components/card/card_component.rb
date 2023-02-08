class CardComponent < ViewComponent::Base
  attr_reader :href

  renders_one :header
  renders_one :footer

  def initialize(background_color: nil, href: nil)
    @href = href
    @styles = []
    @styles << "--background-color: #{background_color}" if background_color.present?
  end

  def style_string
    raw "style=\"#{@styles.join(' ')}\""
  end
end
