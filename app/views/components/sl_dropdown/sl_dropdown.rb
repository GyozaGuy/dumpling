class SlDropdown < ApplicationComponent
  attribute :distance
  attribute :hoist, default: true
  attribute :label, required: true
  attribute :placement,
    default: :bottom_start,
    one_of: %i[
      top
      top_start
      top_end
      bottom
      bottom_start
      bottom_end
      right
      right_start
      right_end
      left
      left_start
      left_end
    ]
  attribute :skidding
  register_element :sl_dropdown

  def view_template
    sl_dropdown(**default_attributes, distance:, hoist:, placement: to_dash(placement), skidding:) {
      sl_button(caret: true, slot: 'trigger') { label }
      yield
    }
  end
end
