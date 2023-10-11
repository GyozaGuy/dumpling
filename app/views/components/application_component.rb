class ApplicationComponent < Phlex::HTML
  include ActiveModel::API
  include ActiveModel::Attributes
  include Dumpling::ComponentHelper
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::Routes

  attribute :data
  attribute :id, :string
  attribute :style, :string

  def initialize(**kwargs)
    super
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

  def add_classes(*args, **kwargs)
    @classes ||= []

    args.each do |value|
      @classes << value
    end

    kwargs.reject { |key| key.end_with?('?') && !send(key) }.each_value do |value|
      @classes << value
    end
  end

  def class_list(*args, **kwargs)
    classes(*@classes, *args, **kwargs)
  end

  def props(**extra_props)
    { data: @data, id: @id, style: @style, **extra_props }
  end
end
