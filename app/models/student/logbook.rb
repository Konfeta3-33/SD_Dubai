class Student::Logbook
  attr_reader :student

  def initialize(student)
    @student = student
  end

  def course_levels
    [
      { name: 'Tandem', status: :skipped },
      { name: 'Cat. A', status: :passed, jumps: [] },
      { name: 'Cat. B', status: :current },
      { name: 'Cat. C1', status: :pending },
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
