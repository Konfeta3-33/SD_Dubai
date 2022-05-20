class InstructorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new instructor_params
    if @instructor.save
      flash[:notice] = "Created Instructor #{@instructor.name} #{@instructor.surname}!"
      redirect_to instructors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit( :name, :surname, :initials, :license, user_attributes:
      [:login, :password])
  end
end
