class Dumpling::ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def default_javascript
    javascript_importmap_tags
    javascript_import_module_tag 'dumpling'
  end

  def default_stylesheets
    stylesheet_link_tag :all, data_turbo_track: 'reload'
  end
end
