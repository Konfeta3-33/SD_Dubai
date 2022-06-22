module Students
  class LogbooksController < ApplicationController
    def show
      @student = Student.find(params[:student_id])
      @logbook = Student::Logbook.new(@student)
    end
  end
end
