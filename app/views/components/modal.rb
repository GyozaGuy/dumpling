class Modal < ApplicationComponent
  include Phlex::DeferredRender

  attribute :active, :boolean, default: false
  attribute :animated, :boolean, default: true
  attribute :title, :string

  def modal_body(&block)
    @body = block
  end

  def modal_footer(&block)
    @footer = block
  end

  def template
    div(**classes('modal', active?: 'is-active'), data: { controller: 'modal' }) {
      div(class: 'modal-background', data: { action: 'click->modal#close' })

      if title
        div(
          **classes(
            'modal-card',
            'animate__animated',
            'animate__faster',
            animated?: 'animate__fadeInDown'
          ),
          data_modal_target: 'content'
        ) {
          header(class: 'modal-card-head') {
            p(class: 'modal-card-title') {
              title
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
          **classes(
            'modal-content',
            'animate__animated',
            'animate__faster',
            animated?: 'animate__fadeInDown'
          ),
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

  private

  def active? = active == true
  def animated? = animated == true
end
