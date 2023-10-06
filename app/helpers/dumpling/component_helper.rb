module Dumpling
  module ComponentHelper
    def method_missing(method_name, *args, **kwargs, &block)
      render(
        method_name.to_s.split('d_').second.classify.safe_constantize.new(*args, **kwargs),
        &block
      )
    end

    def respond_to_missing?(method_name, _args)
      method_name.start_with?('d_')
    end
  end
end
