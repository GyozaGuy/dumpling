class Tag < ApplicationComponent
  include Shared::IsColor
  include Shared::IsLight
  include Shared::IsRounded
  include Shared::IsSize

  attr_accessor :delete, :delete_action, :href, :target, :text

  def template
    if href
      a(**tag_props, href: @href, target: @target) {
        tag_content
      }
    else
      span(**tag_props) {
        tag_content
      }
    end
  end

  private

  def delete? = @delete == true && delete_action? && @text.empty?

  def delete_action? = @delete_action.present?

  def tag_content
    plain @text
    d_delete(action: @delete_action) if @text.present? && delete_action?
  end

  def tag_props
    {
      **class_list(
        'tag',
        delete?: 'is-delete'
      )
    }
  end
end
