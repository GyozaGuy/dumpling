module Dumpling
  module ComponentHelper
    def component(name, *args, **kwargs, &block)
      component = "#{name.to_s.camelize}Component".safe_constantize
      render component.new(*args, **kwargs), &block
    end

    alias vc component

    def method_missing(method_name, *args, **kwargs, &block)
      if method_name.end_with?('_component')
        component_class = method_name.to_s.classify.safe_constantize
        component = component_class.new(*args, **kwargs)
        component.render_in(self, &block)
      else
        super
      end
    end

    def page_title(content)
      content_for(:title, content)
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.end_with?('_component') || super
    end

    # TODO: Make the following more elegant
    def svg(path)
      render inline: Rails.root.join('app', 'assets', 'images', path).read
    rescue StandardError
      render inline: Engine.root.join('app', 'assets', 'images', path).read
    end
  end
end
