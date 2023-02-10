class DialogComponent < ViewComponent::Base
  attr_reader :close_on_click_scrim, :id, :modal, :title

  renders_one :footer
  renders_one :open_button

  def initialize(close_on_click_scrim: true, id: nil, modal: true, showing: false, title: nil)
    @classes = []

    @close_on_click_scrim = close_on_click_scrim
    @id = id
    @modal = modal
    @title = title

    @classes.push('dialog-opening', 'dialog-visible') if showing
  end

  def class_string
    raw "class=\"#{@classes.join(' ')}\""
  end

  def close_on_click_scrim?
    close_on_click_scrim == true
  end

  def modal?
    modal == true
  end

  def svg(path)
    render inline: Engine.root.join('app', 'assets', 'images', path).read
  end
end
