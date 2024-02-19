module Dumpling::ApplicationHelper
  def method_missing(name, *, **, &)
    if (component_class = name.to_s.camelize.safe_constantize)
      return render component_class.new(*, **, &)
    end

    super
  end

  def page_title(title)
    content_for(:page_title, title)
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.start_with?('b_') || method_name.start_with?('sl_') || super
  end
end
