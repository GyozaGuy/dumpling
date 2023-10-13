class Tag < ApplicationComponent
  include Shared::IsColor
  include Shared::IsLight
  include Shared::IsRounded
  include Shared::IsSize

  attribute :delete, :boolean
  attribute :delete_action, :boolean
  attribute :href, :string
  attribute :target, :string
  attribute :text, :string

  def template
    if href
      a(**tag_props, href: href, target: target) {
        tag_content
      }
    elsif delete? && delete_action?
      # TODO: fix this so a button looks good
      a(**tag_props, data_action: delete_action)
    else
      span(**tag_props) {
        tag_content
      }
    end
  end

  private

  def delete? = delete == true && delete_action? && text.blank?

  def delete_action? = delete_action.present?

  def tag_content
    plain text
    d_delete(action: delete_action) if text.present? && delete_action?
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
