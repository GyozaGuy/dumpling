require 'view_component'

module Dumpling
  class Component < ViewComponent::Base
    include ActiveModel::API

    attr_accessor :data, :id

    def initialize(attributes = {})
      classes << attributes[:class] unless attributes[:class].nil?
      attributes.delete(:class)
      super
      @data ||= {}
    end

    def classes
      @classes ||= []
    end

    def class_string
      raw "class=\"#{classes.join(' ')}\""
    end

    def component(name, *args, **kwargs, &block)
      component = "#{name.to_s.camelize}Component".safe_constantize
      render component.new(*args, **kwargs), &block
    end

    def component_name
      self.class.name.gsub('Component', '')
    end

    def component_tag(&block)
      content_tag(
        :div,
        class: classes.join(' '),
        data: {
          component: component_name,
          **@data
        },
        id: @id,
        style: styles.join('; '),
        &block
      )
    end

    def styles
      @styles ||= []
    end

    def style_string
      raw "style=\"#{styles.join('; ')}\""
    end
  end
end
