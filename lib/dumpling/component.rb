module Dumpling
  class Component
    class_attribute :_properties, instance_accessor: false
    self._properties = {}
    attr_reader :name, :properties

    def initialize(name, properties = {})
      @name = name
      @properties = default_properties.deep_merge(properties)
    end

    def partial
      name.include?('/') ? name : "#{name}/#{name}"
    end

    def render(context)
      context.extend(ViewContext)
      context.inject_component_context self
      properties[:children] ||= yield if block_given?
      context.render(partial)
    end

    private

    def default_properties
      self.class._properties.transform_values do |value|
        value[:default]
      end
    end

    class << self
      def component_for(*args)
        component_name = args.first.to_s
        component_name = component_name.split('/').second if component_name.include?('/')
        component_class = "#{component_name.camelize}Component".safe_constantize
        component_class ||= self
        component_class.new(*args)
      end

      def properties(*args)
        options = args.extract_options!

        properties = args.each_with_object({}) do |name, sum|
          sum[name] = options
        end

        define_property_methods(args)
        self._properties = _properties.merge(properties)
      end

      alias property properties

      private

      def define_property_methods(names = [])
        names.each do |name|
          next if method_defined?(name)

          define_method name do
            properties[name.to_sym]
          end
        end
      end
    end
  end

  module ViewContext
    attr_reader :_component

    delegate :properties, to: :_component

    def children
      properties[:children]
    end

    def inject_component_context(component)
      @_component = component
      protected_methods = Dumpling::Component.public_methods(false)
      methods = component.public_methods(false) - protected_methods

      methods.each do |method|
        next if self.class.method_defined?(method)

        self.class.delegate method, to: :_component
      end
    end
  end
end
