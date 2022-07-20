class Student < ApplicationRecord
  class Logbook
    attr_reader :student

    def initialize(student)
      @student = student
    end

    def course_levels # rubocop:disable Metrics/MethodLength
      [
        { name: 'Tandem', status: :skipped },
        { name: 'Cat. A', status: :passed, jumps: [] },
        { name: 'Cat. B', status: :repeat },
        { name: 'Cat. C1', status: :current },
        { name: 'Cat. C2', status: :pending },
        { name: 'Cat. D1', status: :pending },
        { name: 'Cat. D2', status: :pending },
        { name: 'Cat. E1', status: :pending },
        { name: 'Cat. E2', status: :pending }
      ]
    end

    def coaching_jumps
      []
    end
  end
end
