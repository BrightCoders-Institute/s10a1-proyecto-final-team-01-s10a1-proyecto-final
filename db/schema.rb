# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_14_040021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.string "title", limit: 100, null: false
    t.decimal "price_per_day", null: false
    t.integer "bedrooms_number", null: false
    t.integer "bathrooms_number", null: false
    t.integer "beds_number", null: false
    t.integer "max_guests_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "dates_range", null: false
    t.index ["category_id"], name: "index_accommodations_on_category_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "accommodations_details", force: :cascade do |t|
    t.bigint "accommodation_id", null: false
    t.bigint "detail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_accommodations_details_on_accommodation_id"
    t.index ["detail_id"], name: "index_accommodations_details_on_detail_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.string "title", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_accommodations", primary_key: ["user_id", "accommodation_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "accommodation_id", null: false
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_favorite_accommodations_on_accommodation_id"
    t.index ["user_id"], name: "index_favorite_accommodations_on_user_id"
  end

  create_table "favorite_posts", primary_key: ["user_id", "post_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorite_posts_on_post_id"
    t.index ["user_id"], name: "index_favorite_posts_on_user_id"
  end

  create_table "favorite_reservations", primary_key: ["user_id", "reservation_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reservation_id", null: false
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_favorite_reservations_on_reservation_id"
    t.index ["user_id"], name: "index_favorite_reservations_on_user_id"
  end

  create_table "favorites", primary_key: ["user_id", "accommodation_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "accommodation_id", null: false
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_favorites_on_accommodation_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content", null: false
    t.bigint "chat_room_id", null: false
    t.bigint "user_id", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_participants_on_chat_room_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "accommodation_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dates_range", null: false
    t.index ["accommodation_id"], name: "index_reservations_on_accommodation_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "accommodation_id", null: false
    t.string "title", limit: 100, null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_reviews_on_accommodation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.bigint "role_id", default: 4, null: false
    t.string "name", limit: 50
    t.string "phone", limit: 16
    t.string "emergency_contact", limit: 16
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "accommodations", "categories"
  add_foreign_key "accommodations", "users"
  add_foreign_key "accommodations_details", "accommodations"
  add_foreign_key "accommodations_details", "details"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_accommodations", "accommodations"
  add_foreign_key "favorite_accommodations", "users"
  add_foreign_key "favorite_posts", "posts"
  add_foreign_key "favorite_posts", "users"
  add_foreign_key "favorite_reservations", "reservations"
  add_foreign_key "favorite_reservations", "users"
  add_foreign_key "favorites", "accommodations"
  add_foreign_key "favorites", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "participants", "chat_rooms"
  add_foreign_key "participants", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "reservations", "accommodations"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "accommodations"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "roles"
end
