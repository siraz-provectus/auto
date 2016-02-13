class CarsController < ApplicationController
	expose (:cars) { Car.all.includes(:photos) }
	expose :car, attributes: :car_params

  expose (:photo) { Photo.new(car_id: car.id) }

	def new
   	self.car = Car.new
   	# @photos = car.photos.build
	end

	def create
		self.car = Car.new(car_params)

    if car.save
      if params[:photos].present?
        params[:photos]['image'].each do |image|
          photos = car.photos.create!(image: image)
        end
      end

      redirect_to root_url
   	else
      render action: 'new'
    end
	end

  def edit
  end

  def update
    self.car = Car.find(params[:id])

    if car.update(car_params)
      redirect_to root_url
    else
      render action: 'edit'
    end
  end

  def destroy
    car.destroy!
  end

	private

  def car_params
    params.require(:car).permit(:name, :registration_number, :pts, :pts_date, photos: [:car_id, :image])
  end
end
