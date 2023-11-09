require 'phlex-rails'

class ApplicationComponent < Phlex::HTML
  include ActiveModel::API
  include ActiveModel::Attributes
  include Dumpling::ComponentHelper

  Phlex::Rails::Helpers.constants.each do |constant|
    module_to_include = Phlex::Rails::Helpers.const_get(constant)
    next unless module_to_include.is_a?(Module)

    include module_to_include
  end

  attribute :class_list, array: true
  attribute :data, default: {}
  attribute :id, :string
  attribute :style, :string

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

  def add_props(**kwargs)
    @props ||= []

    kwargs.each_value.reject(&:nil?).each do |value|
      @props << value
    end
  end

  def compiled_classes(*args, **kwargs)
    classes(*args, *@classes, *class_list, **kwargs)
  end

  def props(**kwargs)
    { data:, id:, style:, **kwargs }
  end
end
