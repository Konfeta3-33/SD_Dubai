module Students
  class JumpsController < ApplicationController
    before_action :set_student
    before_action :set_jump, only: %i[show update]
    before_action :set_logbook

    def show
      @instructor = Instructor.find(current_user.profile_id)
    end

    def index
      redirect_to student_jump_path(@student, @logbook.jumps.last)
    end

    def update
      authorize @jump
      if @jump.update jump_params
        redirect_to student_jump_path
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_logbook
      @logbook = Student::Logbook.new(@student)
    end

    def set_jump
      @jump = @student.jumps.find(params[:id])
    end

    def jump_params
      params.require(:jump).permit(
        :jump_no,
        :date,
        :place,
        :equipment,
        :aircraft,
        :altitude_ft,
        :delay,
        :total_freefall,
        :status,
        improvement_points: []
      )
    end
  end
end
