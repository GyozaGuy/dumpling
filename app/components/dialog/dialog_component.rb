class DialogComponent < ViewComponent::Base
  attr_reader :id, :title

  renders_one :footer
  renders_one :open_button

  def initialize(
    close_on_click_scrim: true,
    id: nil,
    modal: true,
    movable: true,
    showing: false,
    title: nil
  )
    @classes = []
    @scrim_classes = ['dialog_scrim']

    @close_on_click_scrim = close_on_click_scrim
    @id = id
    @modal = modal
    @movable = movable
    @title = title

    @classes.push('dialog-movable') if movable
    @classes.push('dialog-visible') if showing
    @scrim_classes.push('dialog-visible') if showing
  end

  def class_string
    raw "class=\"#{@classes.join(' ')}\""
  end

  def close_on_click_scrim?
    @close_on_click_scrim == true
  end

  def scrim_class_string
    raw "class=\"#{@scrim_classes.join(' ')}\""
  end

  def modal?
    @modal == true
  end

  def movable?
    @movable == true
  end

  def svg(path)
    render inline: Engine.root.join('app', 'assets', 'images', path).read
  end
end
