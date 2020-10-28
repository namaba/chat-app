class Room < ApplicationRecord
  has_many :messages
  has_many :users_rooms
  has_many :users, through: :users_rooms

  def create_with_users_rooms(user1, user2)
    ActiveRecord::Base.transaction do
      users_rooms.build(user: user1)
      users_rooms.build(user: user2)
      save!
    end
    true
  rescue => e
    logger.warn e
    false
  end
end
