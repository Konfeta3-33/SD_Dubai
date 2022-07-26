class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[show edit update destroy]

  def index
    authorize Instructor
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
    @instructor.build_user
    authorize @instructor
  rescue Pundit::NotAuthorizedError
    flash[:alert] = I18n.t('instructors.not_allowed_to_create')
    redirect_to instructors_path
  end

  def show
  end

  def edit
  end

  def create
    @instructor = Instructor.new instructor_params
    authorize @instructor
    if @instructor.save
      flash[:notice] = "Created Instructor #{@instructor.full_name}!"
      redirect_to instructors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @instructor
    if @instructor.update instructor_params
      flash[:notice] = "Instructor #{@instructor.full_name} updated!"
      redirect_to instructor_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @instructor
    if @instructor.destroy
      redirect_to instructors_path, status: :see_other
      flash[:alert] = "Instructor #{@instructor.full_name} deleted!"
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "Instructor #{@instructor.full_name} has not been deleted!"
    end
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(
      :name,
      :surname,
      :initials,
      :license,
      user_attributes: [:login, :password]
    )
  end
end
