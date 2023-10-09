class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&block)
    doctype

    html {
      head {
        title { "You're awesome" }
        meta name: 'viewport', content: 'width=device-width,initial-scale=1'
        csp_meta_tag
        csrf_meta_tags
        stylesheet_link_tag 'application', data_turbo_track: 'reload'
        stylesheet_link_tag 'https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css'
        javascript_importmap_tags
        javascript_import_module_tag 'dumpling'
      }

      body {
        main(&block)
      }
    }
  end
end
