class Student < ApplicationRecord
  class Logbook
    attr_reader :student

    def initialize(student)
      @student = student
    end

    def init!
      Jumps::Tandem.create!(student: student, status: :skipped)
      Jumps::CategoryA.create!(student: student, status: :current)
    end

    def course_levels # rubocop:disable Metrics/AbcSize
      [
        { name: 'Tandem' }.merge(level_summary(Jumps::Tandem)),
        { name: 'Cat. A' }.merge(level_summary(Jumps::CategoryA)),
        { name: 'Cat. B' }.merge(level_summary(Jumps::CategoryB)),
        { name: 'Cat. C1' }.merge(level_summary(Jumps::CategoryC1)),
        { name: 'Cat. C2' }.merge(level_summary(Jumps::CategoryC2)),
        { name: 'Cat. D1' }.merge(level_summary(Jumps::CategoryD1)),
        { name: 'Cat. D2' }.merge(level_summary(Jumps::CategoryD2)),
        { name: 'Cat. E1' }.merge(level_summary(Jumps::CategoryE1)),
        { name: 'Cat. E2' }.merge(level_summary(Jumps::CategoryE2)),
        { name: 'Coaching', status: :pending, jumps: [] }
      ]
    end

    def coaching_jumps
      []
    end

    def level_summary(type)
      jumps_by_type = jumps.select { |jump| jump.is_a? type }
      status = jumps_by_type.last&.status || 'pending'

      {
        status: status,
        jumps: jumps_by_type
      }
    end

    def jumps
      @jumps ||= student.jumps.order(:created_at)
    end
  end
end
