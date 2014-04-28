class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :image, :name, 
      :password_digest,:password_confirmation, :password

  has_many :tts_as_player_one, foreign_key: 'player_one_id', class_name: 'Ttt'
  has_many :tts_as_player_two, foreign_key: 'player_two_id', class_name: 'Ttt'

  validate :email, prescence: true
  validate :email, uniqueness: true

end
