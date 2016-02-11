class CarsController < ApplicationController
	expose (:cars) { Car.all }
	expose :car, attributes: :car_params

	def new
   	self.car = Car.new
   	# @photos = car.photos.build
	end

	def create
		self.car = Car.new(car_params)

    if car.save
      params[:photos]['image'].each do |image|
        photos = car.photos.create!(image: image)
      end

      redirect_to root_url
   	else
      render action: 'new'
    end
	end

	private

  def car_params
    params.require(:car).permit(:name, :registration_number, :pts, :pts_date, photos: [:car_id, :image])
  end
end