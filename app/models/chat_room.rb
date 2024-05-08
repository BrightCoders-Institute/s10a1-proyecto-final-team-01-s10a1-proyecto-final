class ChatRoom < ApplicationRecord
  has_many :participants, dependent: :destroy
  after_create_commit { broadcast_if_public }
  validates_uniqueness_of :name
  has_many :messages
  scope :public_rooms, -> { where(is_private: false) }
  def broadcast_if_public
    broadcast_append_to "chat_rooms" unless self.is_private
  end

  def self.create_private_room(users, chat_room_name)
    single_chat_room = ChatRoom.create(name: chat_room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, chat_room_id: single_chat_room.id )
    end
    single_chat_room
  end

end
