module Dumpling
  module ComponentHelper
    def component(name, *args, **kwargs, &block)
      component = "#{name.to_s.camelize}Component".safe_constantize
      render component.new(*args, **kwargs), &block
    end

    alias vc component

    def page_title(content)
      content_for(:title, content)
    end

    # TODO: Make the following more elegant
    def svg(path)
      render inline: Rails.root.join('app', 'assets', 'images', path).read
    rescue StandardError
      render inline: Engine.root.join('app', 'assets', 'images', path).read
    end
  end
end
