class Dumpling::ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def default_javascript
    javascript_importmap_tags
    javascript_import_module_tag 'dumpling'
  end

  def default_stylesheets
    stylesheet_link_tag 'application', data_turbo_track: 'reload'
    stylesheet_link_tag 'dumpling'
    stylesheet_link_tag 'https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css'
  end
end
