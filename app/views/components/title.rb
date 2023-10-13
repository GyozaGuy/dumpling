class Title < ApplicationComponent
  attribute :size, :integer, default: 3
  attribute :spaced, :boolean
  attribute :subtitle, :string
  attribute :title, :string

  def initialize(**kwargs)
    super
    @subtitle_size = size + 2
  end

  def template
    h1(**classes('title', "is-#{size}", spaced?: 'is-spaced')) {
      title
    }
    return unless subtitle

    h3(class: ['subtitle', "is-#{[@subtitle_size, 7].min}"]) {
      subtitle
    }
  end

  private

  def spaced? = spaced == true
end
