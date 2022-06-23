require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'login with valid credentials' do
    login = 'ivan'
    password = password_confirmation = 'P@ssw0rd'
    Instructor.create! \
      name: 'Ivan',
      surname: 'Peterson',
      initials: 'IP',
      license: 'D-111111',
      user_attributes: { login:, password:, password_confirmation: }

    visit root_path
    fill_in :user_login, with: login
    fill_in :user_password, with: password
    click_button 'Log in'

    assert_content 'Logged in as ivan'
  end
end
