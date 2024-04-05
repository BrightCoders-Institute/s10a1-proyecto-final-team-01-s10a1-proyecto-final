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

  def self.dates_range_overlap?(first_dates_range, second_dates_range)
    (Range.new(*convert_range_string_to_dates(first_dates_range)))
    .overlaps?(Range.new(*convert_range_string_to_dates(second_dates_range)))
  end

  def self.dates_range_covers_the_second_one?(first_dates_range, second_dates_range)
    (Range.new(*convert_range_string_to_dates(first_dates_range)))
    .cover?(Range.new(*convert_range_string_to_dates(second_dates_range)))
  end

  def self.convert_range_string_to_dates(dates_range)
    dates_range.split('-').map { |date| Date.parse(date) }.sort
  end
end
