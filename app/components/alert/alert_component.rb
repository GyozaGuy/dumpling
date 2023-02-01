class AlertComponent < Dumpling::Component
  property :dismissable, default: true
  property :type

  def class_string
    classes = ['alert']
    classes << "alert-#{type}" unless type.nil?
    classes.join(' ')
  end
end
