class ApplicationComponent < Phlex::HTML
  include ActiveModel::API
  include ActiveModel::Attributes
  include Dumpling::ComponentHelper
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::Routes

  attr_accessor :data, :id, :style

  VALID_COLORS = %w[black danger dark info light link primary success warning white].freeze
  VALID_SIZES = %w[small normal medium large].freeze

  def initialize(**kwargs)
    super
    puts attributes
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  private

  def colored? = VALID_COLORS.include?(@color)

  def props(**extra_props)
    { data: @data, id: @id, style: @style, **extra_props }
  end

  def sized? = VALID_SIZES.include?(@size)
end
