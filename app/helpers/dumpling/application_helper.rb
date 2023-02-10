module Dumpling
  module ApplicationHelper
    def component(name, properties = {}, &block)
      comp = Dumpling::Component.component_for(name, properties)
      comp.render(controller.view_context) do
        capture(&block) if block_given?
      end
    end

    def page_title(content)
      content_for(:title, content)
    end

    # TODO: Make the following more elegant
    def svg(path)
      render inline: Rails.root.join('app', 'assets', 'images', path).read
    rescue StandardError
      render inline: Engine.root.join('app', 'assets', 'images', path).read
    end

    def vc(name, *args, **kwargs, &block)
      component = "#{name.to_s.camelize}Component".safe_constantize
      render component.new(*args, **kwargs), &block
    end
  end
end
