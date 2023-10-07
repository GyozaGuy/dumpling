class Modal < ApplicationComponent
  def template(&block)
    div(class: 'modal', data: { controller: 'modal' }) {
      div(class: 'modal-background', data: { action: 'click->modal#close' })

      div(class: 'modal-content', &block)

      button(
        aria_label: 'close',
        class: 'modal-close is-large',
        data: { action: 'modal#close' },
        type: 'button'
      )
    }
  end
end
