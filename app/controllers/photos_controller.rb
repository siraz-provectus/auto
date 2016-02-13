class PhotosController < ApplicationController
  expose :photo, attributes: :photo_params

  def create
    self.photo = Photo.create!(photo_params)
    @new_photo = Photo.new(car_id: photo_params[:car_id])
  end

  def destroy
    photo.destroy!
  end

  private

  def photo_params
    params.require(:photo).permit(:car_id, :image)
  end
end
