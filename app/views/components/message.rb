class Message < ApplicationComponent
  include Shared::IsColor
  include Shared::IsSize

  attr_accessor :title

  def template(&block)
    article(
      **classes('message', color?: "is-#{color}", size?: "is-#{@size}"),
      data: { controller: 'message' }
    ) {
      if @title
        div(class: 'message-header') {
          p {
            @title
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
