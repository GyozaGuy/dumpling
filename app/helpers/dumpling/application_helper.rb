module Dumpling
  module ApplicationHelper
    def component(name, *args, &block)
      render_component(name, *args, &block)
    end

    def title(content)
      content_for(:title, content)
    end
  end
end
