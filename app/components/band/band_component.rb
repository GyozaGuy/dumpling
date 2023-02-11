class BandComponent < Dumpling::Component
  def initialize(args)
    args => { background_color:, size: }
    classes << args[:class] if args[:class]
    styles << "--band-background-color: #{background_color}" if background_color
    styles << "--band-padding: #{padding_size(size)}"
  end

  def padding_size(size)
    {
      'xs' => 'var(--spacing-normal)',
      'sm' => 'var(--spacing-large2)',
      'md' => 'var(--spacing-large4)',
      'lg' => 'var(--spacing-large6)',
      'xl' => 'var(--spacing-large8)'
    }[size]
  end
end
