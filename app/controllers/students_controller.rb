class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new student_params
    if @student.save
      flash[:notice] = "Created Student #{@student.name} #{@student.surname}!"
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update student_params
      flash[:notice] = "Student #{@student.name} #{@student.surname} update!"
      redirect_to student_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :surname, :phone, :email, :birthday, :country, :city, :address)
  end
end
