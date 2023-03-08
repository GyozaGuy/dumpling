class BandComponent < Dumpling::Component
  def initialize(args = {})
    classes << args[:class] if args[:class]
    styles << "--band-background: #{args[:background]}" if args[:background]
    styles << "--band-padding: #{padding_size(args[:size])}"
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
