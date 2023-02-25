require 'view_component'

module Dumpling
  class Component < ViewComponent::Base
    include ActiveModel::Model

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

    def styles
      @styles ||= []
    end

    def style_string
      raw "style=\"#{styles.join('; ')}\""
    end
  end
end
