class Dumpling::DumplingAssetsController < ApplicationController
  def show
    asset_path = "dumpling/#{params[:path]}.#{params[:format]}"
    asset = File.read("#{Dumpling::Engine.root}/app/assets/images/#{asset_path}")

    send_data(
      asset,
      disposition: 'inline',
      type: 'image/svg+xml'
    )
  end
end
