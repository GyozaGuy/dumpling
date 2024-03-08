class ApplicationView < ApplicationComponent
  # The ApplicationView is an abstract class for all your views.

  # By default, it inherits from `ApplicationComponent`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.

  def template
    @_view_context.instance_variables.each do |variable|
      instance_variable_set(variable, @_view_context.instance_variable_get(variable))
    end
  end
end
