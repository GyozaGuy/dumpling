class PagesController < ApplicationController
  layout -> { ApplicationLayout }

  def test
    render TestPage
  end
end
