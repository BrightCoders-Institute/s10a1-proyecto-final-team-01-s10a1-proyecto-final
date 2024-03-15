require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'render a profile view' do
    user = User.create!(
      name: 'Juan Pérez',
      email: 'jperez@gmail.com',
      phone: '3123211234',
      emergency_contact: '3123121235',
      password: 'testpassword',
      password_confirmation: 'testpassword',
      confirmed_at: Time.now
    )

    sign_in user

    get profile_path
    assert_response :success
    assert_select '.name', user.name
    assert_select '.email', user.email
    assert_select '.phone', user.phone
    assert_select '.emergency_contact', user.emergency_contact
  end

  test 'render an edit profile form' do
    user = User.create!(
      name: 'Juan Pérez',
      email: 'jperez@gmail.com',
      phone: '3123211234',
      emergency_contact: '3123121235',
      password: 'testpassword',
      password_confirmation: 'testpassword',
      confirmed_at: Time.now
    )

    sign_in user

    get edit_profile_path
    assert_response :success
    assert_select 'form'
  end

  test 'allow to update a profile' do
    user = User.create!(
      name: 'Juan Pérez',
      email: 'jperez@gmail.com',
      phone: '3123211234',
      emergency_contact: '3123121235',
      password: 'testpassword',
      password_confirmation: 'testpassword',
      confirmed_at: Time.now
    )

    sign_in user

    patch profile_path, params: {
      user: {
        name: 'José Erik'
      }
    }

    assert_redirected_to profile_path
    assert_equal flash[:notice], 'Your user has been successfully updated.'
  end
end
