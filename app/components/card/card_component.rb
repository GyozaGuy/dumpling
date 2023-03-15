class CardComponent < Dumpling::Component
  attr_accessor :background, :href

  renders_one :header
  renders_one :footer

  def initialize(attributes = {})
    classes << 'card_link' if attributes.dig(:data, :action)
    super
    return unless attributes[:background].present?

    styles << "--card-background: #{attributes[:background]}"
  end
end
