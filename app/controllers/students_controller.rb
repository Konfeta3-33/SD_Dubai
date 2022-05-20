class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
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

  private

  def student_params
    params.require(:student).permit(:name, :surname, :phone, :email)
  end

end
