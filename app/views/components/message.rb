class Message < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attribute :title, :string

  def template(&block)
    article(
      **compiled_classes('message'),
      data: { controller: 'message' }
    ) {
      if title
        div(class: 'message-header') {
          p {
            title
          }
          button(
            aria_label: 'delete',
            class: 'delete',
            data: { action: 'message#close' },
            type: 'button'
          )
        }
      end

      div(class: 'message-body', &block)
    }
  end
end
