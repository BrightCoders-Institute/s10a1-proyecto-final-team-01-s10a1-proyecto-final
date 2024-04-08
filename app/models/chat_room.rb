class ChatRoom < ApplicationRecord
  validates_uniqueness_of :name
  has_many :messages
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit {broadcast_append_to "chat_rooms"}
end
