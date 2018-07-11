class HighFlyersController < ApplicationController
  def show
    highflyer = Highflyer.at_position(highflyer_params[:id])

    if highflyer.present?
      render json: highflyer, serializer: HighflyerSerializer, status: :ok
    else
      render(
        json: { message: 'There is no highflyer at this position' },
        status: :not_found
      )
    end
  end

  def rate
    rating = Highflyer.rate_teacher(teacher_id: highflyer_params[:teacher_id],
                                    rating: highflyer_params[:rating],
                                    id: highflyer_params[:id])

    if rating.errors.present?
      render json: { errors: rating.errors.full_messages.join(', ') },
             status: :unprocessable_entity
    else
      render json: rating, serializer: TeacherRatingSerializer, status: :created
    end
  end

  private

  def highflyer_params
    params.permit(:id, :name, :email, :teacher_id, :rating)
  end
end
