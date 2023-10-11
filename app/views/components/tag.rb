class Tag < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attr_accessor :delete, :delete_action, :href, :light, :rounded, :target, :text

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

  def light? = @light == true

  def rounded? = @rounded == true

  def tag_content
    plain @text
    d_delete(action: @delete_action) if @text.present? && delete_action?
  end

  def tag_props
    {
      **class_list(
        'tag',
        delete?: 'is-delete',
        light?: 'is-light',
        rounded?: 'is-rounded'
      )
    }
  end
end
