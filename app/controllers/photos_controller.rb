class PhotosController < ApplicationController
# truncated for brevity.
  def create
    params[:images].each{ |image|
      @photo = Photo.create(image: image)
      if @photo.save
        respond_to do |format|
          format.html { render json: @photo.to_jq_upload, content_type: 'text/html', layout: false }
          format.json { render json: @photo.to_jq_upload }
        end
      else
        render json: { error: @photo.errors.full_messages }, status: 304
      end
    }
  end
end