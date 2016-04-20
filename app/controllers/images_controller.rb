class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    @image.save!
    render 'images/show'
  end

  def destroy
    Image.destroy_all
    render 'base/empty'
  end

  private
    def image_params
      { picture: params[:picture] }
    end

end