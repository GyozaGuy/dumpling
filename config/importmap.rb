dumpling_path = Dumpling::Engine.root

pin 'dumpling', to: 'dumpling/application.js', preload: true
pin_all_from(
  dumpling_path.join('app', 'javascript', 'dumpling', 'controllers'),
  under: 'dumpling/controllers'
)
pin_all_from(
  dumpling_path.join('app', 'javascript', 'dumpling', 'helpers'),
  under: 'dumpling/helpers'
)
