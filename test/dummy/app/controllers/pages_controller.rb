class PagesController < ApplicationController
  layout -> { ApplicationLayout }

  def test
    render TestPage.new
  end
end
