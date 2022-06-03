class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    authorize Student
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
    authorize @student
  end

  def edit
  end

  def create
    @student = Student.new student_params
    authorize @student
    if @student.save
      flash[:notice] = "Created Student #{@student.name} #{@student.surname}!"
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @student
    if @student.update student_params
      flash[:notice] = "Student #{@student.name} #{@student.surname} update!"
      redirect_to student_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @student
    @student.destroy!
    redirect_to students_path, status: :see_other
    flash[:alert] = "Student #{@student.name} #{@student.surname} deleted!"
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :name,
      :surname,
      :phone,
      :email,
      :birthday,
      :country,
      :city,
      :address
    )
  end
end
