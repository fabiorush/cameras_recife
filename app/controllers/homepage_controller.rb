class HomepageController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      redirect_to cameras_path
    end
  end

  def test
  end
end
