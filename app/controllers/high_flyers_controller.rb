class HighFlyersController < ApplicationController
  def show
    highflyer = Highflyer.at_position(highflyer_params[:id])

    if highflyer.present?
      render json: { highflyer: highflyer}, status: :ok
    else
      render(
        json: { message: 'There is no highflyer at this position' },
        status: :not_found
      )
    end
  end

  private

  def highflyer_params
    params.permit(:id, :name, :email, :teacher_id, :rating)
  end
end
