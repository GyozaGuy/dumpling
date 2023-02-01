module Dumpling
  module ApplicationHelper
    def component(name, properties = {}, &block)
      comp = Dumpling::Component.component_for(name, properties)
      comp.render(controller.view_context) do
        capture(&block) if block_given?
      end
    end

    # TODO: Make the following more elegant
    def svg(path)
      render inline: Engine.root.join('app', 'assets', 'images', path).read
    rescue StandardError
      render inline: Rails.root.join('app', 'assets', 'images', path).read
    end

    def title(content)
      content_for(:title, content)
    end
  end
end
