class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      ImageProcessingWorker.perform_async(@image.id)

      render :show
    else
      @errors = @image.errors
      render 'base/errors', status: 422
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!

    render 'base/empty'
  end

  private
    def image_params
      {
        remote_picture_url: params[:picture],
        effect: params[:effect]
      }
    end

end