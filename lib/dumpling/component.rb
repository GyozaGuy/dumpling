require 'view_component'

module Dumpling
  class Component < ViewComponent::Base
    def classes
      @classes ||= []
      @classes
    end

    def class_string
      raw "class=\"#{classes.join(' ')}\""
    end

    def styles
      @styles ||= []
      @styles
    end

    def style_string
      raw "style=\"#{styles.join('; ')}\""
    end
  end
end
