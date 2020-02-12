class CamerasController < ApplicationController
  before_action :authenticate_user!

  def index
    @cameras = current_user.cameras
    if @cameras.empty?
      redirect_to cameras_list_path
    end
  end

  def list
    @cameras_user = current_user.cameras
    @cameras_other = Camera.all.select { |camera| !camera.users.find_by(id: current_user.id) }
  end

  def create
    camera = Camera.find(params[:camera_id])
    if camera.nil?
      flash[:alert] = "Camera do not exists"
    else
      camera.users << current_user
      flash[:notice] = "Camera #{camera.name} added"
    end
    redirect_to cameras_list_path
  end

  def destroy
    camera = Camera.find(params[:id])
    UserCamera.destroy_by(user_id: current_user.id, camera_id: params[:id])
    flash[:notice] = "You have stop tracking #{camera.name}"
    redirect_to cameras_list_path
  end
end
