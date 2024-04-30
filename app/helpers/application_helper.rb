module ApplicationHelper
  include Pagy::Frontend

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

  def navigation_text
    controller_name.humanize
  end

  def navigation_path
    controller_name_hashmap = {
      users: users_path,
      profile: profile_path,
      accommodations: accommodations_path
    }
    controller_name_hashmap[controller_name.to_sym]
  end
end
