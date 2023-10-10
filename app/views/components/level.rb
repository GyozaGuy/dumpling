class Level < ApplicationComponent
  attr_accessor :mobile

  def item(centered: nil, &block)
    div(class: ['level-item', centered ? 'has-text-centered' : nil], &block)
  end

  def template(&block)
    nav(**classes('level', mobile?: 'is-mobile'), &block)
  end

  private

  def mobile? = @mobile == true
end
