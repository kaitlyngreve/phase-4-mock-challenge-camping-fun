class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid_response

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_not_valid_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end