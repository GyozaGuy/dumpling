class Message < ApplicationComponent
  attr_accessor :color, :size, :title

  def template(&block)
    article(
      **classes('message', colored?: "is-#{@color}", sized?: "is-#{@size}"),
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

  private

  def colored? = @color.present?

  def sized? = @size.present?
end
