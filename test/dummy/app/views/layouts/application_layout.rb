class ApplicationLayout < Dumpling::ApplicationLayout
  def view_template(&block)
    doctype

    html {
      head {
        title { "#{content_for(:page_title) || 'Loading...'} :: Dumpling" }
        meta name: 'viewport', content: 'width=device-width,initial-scale=1'
        csp_meta_tag
        csrf_meta_tags
        default_stylesheets
        default_javascript
      }

      body {
        main(&block)
      }
    }
  end
end
