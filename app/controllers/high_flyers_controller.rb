class HighFlyersController < ApplicationController
  def show
    highflyer = Highflyer.at_possision(highflyer_params[:id])

    if highflyer.present?
      render json: { highflyer: highflyer }, status: :ok
    else
      render json: {message: 'There is no high flyer at this position'}, status: :not_found
    end
  end

  def rate
  end

  private

  def highflyer_params
    params.permit(:id, :name, :email)
  end
end
