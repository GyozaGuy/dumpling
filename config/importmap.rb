dumpling_root = Dumpling::Engine.root
components_path = dumpling_root.join('app', 'components')
dumpling_path = dumpling_root.join('app', 'javascript', 'dumpling')

pin 'dumpling', to: 'dumpling/application.js', preload: true
pin_all_from components_path, under: 'dumpling/components'
pin_all_from dumpling_path.join('controllers'), under: 'dumpling/controllers'
pin_all_from dumpling_path.join('helpers'), under: 'dumpling/helpers'
pin_all_from 'app/components', under: 'components'
