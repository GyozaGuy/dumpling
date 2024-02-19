class ApplicationComponent < Phlex::HTML
  include Dumpling::ApplicationHelper

  Phlex::Rails::Helpers.constants.each do |constant|
    module_to_include = Phlex::Rails::Helpers.const_get(constant)
    next unless module_to_include.is_a?(Module)

    include module_to_include
  end

  def self.attribute(name, **params)
    @attributes ||= []
    @attributes << [name, params]
  end

  def initialize(*bools, **params)
    default_attribute_names = %i[class data id style]

    default_attribute_names.each do |attribute|
      name = attribute == :class ? '@class_string' : "@#{attribute}"
      value = if attribute == :data
                {
                  component: true,
                  **params[attribute] || {}
                }
              else
                params[attribute]
              end
      instance_variable_set(name, value)
      define_singleton_method(name[1..]) { instance_variable_get(name) }
    end

    attributes = self.class.instance_variable_get('@attributes') || []

    bools.each do |bool|
      raise "Invalid attribute for #{self.class}: #{bool}" unless attributes.find {
                                                                    _1.first == bool
                                                                  }
    end

    params.each_key do |name|
      raise "Invalid attribute for #{self.class}: #{name}" unless [
        *default_attribute_names,
        *attributes.collect(&:first)
      ].include?(name)
    end

    attributes.each do |name, options|
      value = params[name] || options[:default]

      if bools.include?(name)
        value = true
      else
        raise "#{name} must be an array" if options[:array] && value.present? && !value.is_a?(Array)
        unless options[:one_of].nil? || options[:one_of].include?(value)
          raise "#{name} is invalid: #{value}\nValid values are #{options[:one_of]}"
        end
        raise "#{name} is required" if options[:required] && value.nil?
      end

      instance_variable_set("@#{name}", value)
      define_singleton_method(name) { instance_variable_get("@#{name}") }
      define_singleton_method("#{name}?") { instance_variable_get("@#{name}") }
    end
  end

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  def default_attributes
    { class: class_string, data:, id:, style: }
  end

  private

  def to_dash(sym)
    sym.to_s.gsub('_', '-')
  end
end
