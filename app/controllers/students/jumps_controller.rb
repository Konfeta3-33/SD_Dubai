module Students
  class JumpsController < ApplicationController
    before_action :set_student
    before_action :set_logbook

    def show
      @jump = @student.jumps.find(params[:id])
    end

    def index
      redirect_to student_jump_path(@student, @logbook.jumps.last)
    end

    private

    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_logbook
      @logbook = Student::Logbook.new(@student)
    end
  end
end
