class SpicesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    spice.update(spice_params)
    render json: spice
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    spice.destroy
    head :no_content
  end

  private

  def render_not_found_response
    render json: {error: "Spice not found"}, status: :not_found
  end
  def spice_params
    params.permit(:title, :image, :description , :notes, :rating)
  end
end
