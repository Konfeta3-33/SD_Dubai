class InstructorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instructor, only: %i[show edit destroy]

  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def show
  end

  def edit
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

  def update
    if @instructor.update instructor_params
      flash[:notice] = "Instructor #{@instructor.name} #{@instructor.surname} updated!"
      redirect_to instructor_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @instructor.destroy
    redirect_to instructors_path, status: :see_other
    flash[:alert] = "Instructor #{@instructor.name} #{@instructor.surname} deleted!"
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :surname, :initials, :license, user_attributes:
      [:login, :password])
  end
end
