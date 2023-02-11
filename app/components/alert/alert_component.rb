class AlertComponent < Dumpling::Component
  attr_reader :dismissable

  def initialize(dismissable: true, type: nil)
    classes << ['alert']
    @dismissable = dismissable
    classes << "alert-#{type}" if type
  end

  def dismissable?
    @dismissable == true
  end

  def svg(path)
    render inline: Dumpling::Engine.root.join('app', 'assets', 'images', 'dumpling', path).read
  end
end
