require 'application_system_test_case'

class StudentsTest < ApplicationSystemTestCase
  test 'admin user creates student' do
    sign_in users(:admin)
    visit students_path

    click_link 'Create Student'
    fill_in :student_name, with: 'Ivan'
    fill_in :student_surname, with: 'Ivanov'
    fill_in :student_email, with: 'ivanov@ivan.com'
    fill_in :student_phone, with: '+123456'

    click_button 'Save'

    assert_content 'Created Student Ivan Ivanov!'
  end

  test 'instructor user creates student' do
    sign_in users(:instructor)
    visit students_path

    click_link 'Create Student'
    fill_in :student_name, with: 'Ivan'
    fill_in :student_surname, with: 'Ivanov'
    fill_in :student_email, with: 'ivanov@ivan.com'
    fill_in :student_phone, with: '+123456'

    click_button 'Save'

    assert_content 'Created Student Ivan Ivanov!'
  end

  test 'instructor user can not delete student' do
    sign_in users(:instructor)
    visit student_path(students(:peter))

    click_link 'Edit'

    assert_no_button 'Delete'
  end
end
