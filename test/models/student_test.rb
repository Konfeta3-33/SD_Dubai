require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test '#full_name' do
    student = Student.create! \
      name: 'Alex',
      surname: 'Folk',
      email: 'ab@ex.com',
      phone: '+102'

    assert_equal 'Alex Folk', student.full_name
  end
end
