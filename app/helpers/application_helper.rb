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
    controller_name.singularize.humanize
  end

  def truncate_words(text, length = 20, end_string = '...')
    plain_text = text.to_plain_text
    words = plain_text.split
    words.length > length ? words[0...length].join(' ') + end_string : plain_text
  end
end
