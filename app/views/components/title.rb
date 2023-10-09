class Title < ApplicationComponent
  attr_accessor :size, :spaced, :subtitle, :title

  def initialize(**kwargs)
    super
    @size ||= 3
    @subtitle_size = @size + 2
  end

  def template
    h1(**classes('title', "is-#{@size}", spaced?: 'is-spaced')) {
      @title
    }
    return unless @subtitle

    h3(class: ['subtitle', "is-#{[@subtitle_size, 7].min}"]) {
      @subtitle
    }
  end

  private

  def spaced? = @spaced == true
end
