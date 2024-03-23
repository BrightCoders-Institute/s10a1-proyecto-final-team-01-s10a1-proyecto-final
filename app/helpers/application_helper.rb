module ApplicationHelper
  include Pagy::Frontend
  
  def print_home_link
    link_to 'Home', root_path, class: 'no-underline text-center text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_sign_in_link
    link_to 'Sign in', new_user_session_path,
            class: 'no-underline ml-6 sm:ml-8 text-center text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_edit_profile_link
    link_to 'Edit Profile', edit_user_registration_path,
            class: 'no-underline ml-6 sm:ml-8 text-center text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_sign_out_button
    button_to 'Sign out', destroy_user_session_path,
              method: :delete, class: 'ml-6 sm:ml-8 text-center text-gray-100 hover:text-gray-300 font-bold'
  end
end
