class ColumnsComponent < Dumpling::Component
  attr_accessor :count

  def initialize(attributes = {})
    super
    @count ||= 2
  end
end
