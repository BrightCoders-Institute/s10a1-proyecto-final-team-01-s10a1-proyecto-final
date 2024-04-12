class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
  validates :content, presence: true
  after_create_commit { broadcast_append_to self.chat_room }
  before_create :confirm_participant

  def confirm_participant
    return unless chat_room.is_private
      is_participant = Participant.where(user_id: user.id, chat_room_id: chat_room.id).first
      throw :abort unless is_participant
    end
  end

