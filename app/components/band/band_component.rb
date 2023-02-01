class BandComponent < Dumpling::Component
  property :background_color
  property :size, default: 'md'

  def class_string
    "class=\"#{properties[:class]}\"" unless properties[:class].nil?
  end

  def padding_size
    {
      'xs' => 'var(--spacing-normal)',
      'sm' => 'var(--spacing-large2)',
      'md' => 'var(--spacing-large4)',
      'lg' => 'var(--spacing-large6)',
      'xl' => 'var(--spacing-large8)'
    }[size]
  end

  def style_string
    styles = []
    styles << "--band-background-color: #{background_color}" unless background_color.nil?
    styles << "--band-padding: #{padding_size}"
    "style=\"#{styles.join('; ')}\""
  end
end
