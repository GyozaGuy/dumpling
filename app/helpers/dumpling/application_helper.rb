module Dumpling
  module ApplicationHelper
    def component(name, *args, &block)
      render("components/#{name}/#{name}", *args, &block)
    rescue StandardError
      render("#{name}/#{name}", *args, &block)
    end

    def title(content)
      content_for(:title, content)
    end
  end
end
