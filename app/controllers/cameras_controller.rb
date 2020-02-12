class CamerasController < ApplicationController
  def index
    @cameras = current_user.cameras
  end
end
