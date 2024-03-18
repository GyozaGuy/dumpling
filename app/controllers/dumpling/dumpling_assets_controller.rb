class Dumpling::DumplingAssetsController < ApplicationController
  def show
    asset_path = "dumpling/#{params[:path]}.#{params[:format]}"
    asset = HTTPX.get(request.base_url + ActionController::Base.helpers.asset_path(asset_path))

    send_data(
      asset,
      disposition: 'inline',
      type: 'image/svg+xml'
    )
  end
end
