require 'phlex-rails'

class Dumpling::ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def default_javascript
    javascript_importmap_tags
    javascript_import_module_tag 'dumpling'
  end

  def default_stylesheets
    stylesheet_link_tag :all, data_turbo_track: 'reload'
    stylesheet_link_tag 'https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css'
    stylesheet_link_tag 'https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.14.0/cdn/themes/light.css'
  end
end
