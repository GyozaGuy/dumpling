require 'phlex-rails'

class ApplicationComponent < Phlex::HTML
  include ActiveModel::API
  include ActiveModel::Attributes
  include Dumpling::ComponentHelper
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::ImagePath
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes

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

  def class_list(*args, **kwargs)
    classes(*@classes, *args, **kwargs)
  end

  def props(**kwargs)
    { data: data, id: id, style: style, **kwargs }
  end
end
