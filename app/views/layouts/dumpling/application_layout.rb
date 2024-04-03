class Dumpling::ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def default_javascript
    javascript_importmap_tags
    javascript_import_module_tag 'dumpling'
  end

  def default_meta
    meta name: 'viewport', content: 'width=device-width,initial-scale=1'
    csp_meta_tag
    csrf_meta_tags
    helpers.turbo_refreshes_with method: :morph, scroll: :preserve
  end

  def default_stylesheets(theme: :light)
    stylesheet_link_tag :all, data_turbo_track: 'reload'
    stylesheet_link_tag 'https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css'
    stylesheet_link_tag "https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.15.0/cdn/themes/#{theme}.css"
  end
end
