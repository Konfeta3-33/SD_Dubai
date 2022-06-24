require 'application_system_test_case'

class InstructorsTest < ApplicationSystemTestCase
  test 'admin user creates instructor' do
    sign_in users(:admin)
    visit instructors_path

    click_link 'Create Instructor'
    fill_in :instructor_name, with: 'Alex'
    fill_in :instructor_surname, with: 'Boorke'
    fill_in :instructor_initials, with: 'AE'
    fill_in :instructor_license, with: 'D-0000001'
    fill_in :instructor_user_attributes_login, with: 'aboorke'
    fill_in :instructor_user_attributes_password, with: 'P@ssw0rd'

    click_button 'Save'

    assert_content 'Created Instructor Alex Boorke!'
  end

  test 'non-admin user can not create instructor' do
    sign_in users(:instructor)

    visit instructors_path
    assert_no_css 'a', text: 'Create Instructor'

    visit new_instructor_path
    assert_current_path instructors_path
    assert_content "You're not allowed to create new instructor"
  end
end
