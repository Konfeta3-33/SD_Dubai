module Instructors
  class CredentialsController < ApplicationController
    before_action :set_instructor

    def edit
    end

    def update
      if @instructor.update instructor_params
        flash[:notice] = "Instructor's credentials #{@instructor.name} #{@instructor.surname}
updated!"
        redirect_to @instructor
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_instructor
      @instructor = Instructor.find(params[:instructor_id])
    end

    def instructor_params
      params.require(:instructor).permit(user_attributes: [:login, :password])
    end
  end
end
