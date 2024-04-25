# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

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

users_list = [
  {role_id: Role.find_by(name: 'guest').id, email: 'guestest@brightcoders.com'},
  {role_id: Role.find_by(name: 'host').id, email: 'hostest@brightcoders.com'},
  {role_id: Role.find_by(name: 'staff').id, email: 'stafftest@brightcoders.com'},
  {role_id: Role.find_by(name: 'superadmin').id, email: 'admintest@brightcoders.com'},
]

guest_id, host_id, staff_id, admin_id = users_list.map do |user|
  db_user = User.find_or_create_by(email: user[:email])
  db_user.update(role_id: user[:role_id], password: '123123', password_confirmation: '123123')
  db_user.skip_confirmation!
  db_user.save!
  db_user.id
end

30.times do |number|
  count = number + 1
  accommodation = Accommodation.where(title: "Accommodation no. #{count}").first_or_initialize
  accommodation.update(user_id: host_id, category_id: 3, price_per_day: rand(100..10000), bedrooms_number: 3,
                       bathrooms_number: 5, beds_number: 3, max_guests_number: 3,
                       address: 'Mexico City', latitude: 0.19433e2, longitude: -0.99133e2,
                       dates_range: "2024/03/10 - 2024/03/16")
  rules = ActionText::RichText.where(record_type: 'Accommodation', record_id: accommodation.id,
                                     name: 'rules').first_or_initialize
  description = ActionText::RichText.where(record_type: 'Accommodation', record_id: accommodation.id,
                                           name: 'description').first_or_initialize
  rules.update(body: Faker::Lorem.sentence)
  description.update(body: Faker::Lorem.sentence)

  reservation = Reservation.where(user_id: guest_id, accommodation_id: accommodation.id).first_or_initialize
  reservation.update(active: 1, dates_range: "2024/03/10 - 2024/03/12")

  review = Review.where(title: "Review no. #{accommodation.id}").first_or_initialize
  review.update(user_id: guest_id, accommodation_id: accommodation.id, rating: rand(0..5))
  content = ActionText::RichText.where(record_type: 'Review', record_id: review.id,
                                           name: 'content').first_or_initialize
  content.update(body: Faker::Lorem.sentence)
end
