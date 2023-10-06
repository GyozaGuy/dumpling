class ApplicationComponent < Phlex::HTML
  include ActiveModel::API
  include Dumpling::ComponentHelper
  include Phlex::Rails::Helpers::Routes

  attr_accessor :data, :id, :style

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  private

  def props(**extra_props)
    { data: @data, id: @id, style: @style, **extra_props }
  end
end
