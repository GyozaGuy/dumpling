# TODO: Figure out how to build this component
class Tile < ApplicationComponent
  def template(&block)
    div(class: 'tile is-ancestor', &block)
  end
end
