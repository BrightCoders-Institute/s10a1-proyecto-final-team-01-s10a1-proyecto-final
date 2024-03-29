# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

roles_list = %i[superadmin staff host guest]
categories_list = %i[room farm amazing_pool countryside national_park
                     historical_home lakefront cabin beachfront castle
                     design amazing_view]
details_list = %i[wifi kitchen working_place washing_mashine administration
                  dryer_machine hair_dryer television air_conditioning pet_friendly
                  garden_view]

roles_list.each { |role| Role.find_or_create_by(name: role) }
categories_list.each { |category| Category.find_or_create_by(name: category) }
details_list.each { |detail| Detail.find_or_create_by(name: detail) }

30.times do |number|
  count = number + 1
  accommodation = Accommodation.where(name: "Accommodation no. #{count}").first_or_initialize
  accommodation.update(user_id: 9, category_id: 3, price_per_day: 300, rating: 3, bedrooms_number: 3,
                       bathrooms_number: 5, beds_number: 3, max_guests_number: 3,
                       address: 'Mexico City', latitude: 0.19433e2, longitude: -0.99133e2,
                       dates_range: "2024/03/10 - 2024/03/16")
end
