class CardComponent < Dumpling::Component
  attr_reader :href

  renders_one :header
  renders_one :footer

  def initialize(args = {})
    classes << 'card_link' if args[:href]
    classes << args[:class] if args[:class]
    @href = args[:href]
    return unless args[:background_color].present?

    styles << "--card-background-color: #{args[:background_color]}"
  end
end
