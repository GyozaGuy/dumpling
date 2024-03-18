class Dumpling::DumplingAssetsController < ApplicationController
  def show
    send_data(
      HTTPX.get(request.base_url + ActionController::Base.helpers.asset_path("#{params[:path]}.#{params[:format]}")),
      disposition: 'inline',
      type: 'image/svg+xml'
    )
  end
end
