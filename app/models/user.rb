class User < ActiveRecord::Base
  has_secure_password
  

  attr_accessible :email, :image, :name, 
      :password_digest,:password_confirmation, :password, :scheme

  

  has_many :tts_as_player_one, foreign_key: 'player_one_id', class_name: 'Ttt'
  has_many :tts_as_player_two, foreign_key: 'player_two_id', class_name: 'Ttt'

  has_many :messages_as_to_user, foreign_key: 'to_user_id', class_name: 'Message'
  has_many :messages

  has_many :moves

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def challenges
      messages_as_to_user
  end


end
