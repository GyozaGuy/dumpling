class Modal < ApplicationComponent
  include Phlex::DeferredRender

  attr_accessor :title

  def modal_body(&block)
    @body = block
  end

  def modal_footer(&block)
    @footer = block
  end

  def template
    div(class: 'modal', data: { controller: 'modal' }) {
      div(class: 'modal-background', data: { action: 'click->modal#close' })

      if @title
        div(
          class: 'modal-card animate__animated animate__fadeInDown',
          data_modal_target: 'content'
        ) {
          header(class: 'modal-card-head') {
            p(class: 'modal-card-title') {
              @title
            }
            button(
              aria_label: 'close',
              class: 'delete',
              data: { action: 'modal#close' },
              type: 'button'
            )
          }

          section(class: 'modal-card-body', &@body)

          footer(class: 'modal-card-foot', &@footer) if @footer
        }
      else
        div(
          class: 'modal-content animate__animated animate__fadeInDown',
          data_modal_target: 'content',
          &@body
        )

        button(
          aria_label: 'close',
          class: 'modal-close is-large',
          data: { action: 'modal#close' },
          type: 'button'
        )
      end
    }
  end
end
