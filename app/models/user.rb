class User < ActiveRecord::Base
  has_secure_password


  attr_accessible :email, :image, :name, 
      :password_digest,:password_confirmation, :password, :scheme

  mount_uploader :image, ImageUploader   

  has_many :ttts_as_player_one, foreign_key: 'player_one_id', class_name: 'Ttt'
  has_many :ttts_as_player_two, foreign_key: 'player_two_id', class_name: 'Ttt'

  has_many :messages_as_to_user, foreign_key: 'to_user_id', class_name: 'Message'
  has_many :messages

  has_many :moves

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def challenges
    messages_as_to_user
  end
  
  def games_played
    a = ttts_as_player_one.where("winner is not null")
    a += ttts_as_player_two.where("winner is not null and player_one_id  != player_two_id")
  end

  def games_all_won 
    a = ttts_as_player_one.where("winner = 1")
    a += ttts_as_player_two.where("winner = 2")
  end
  def games_all_lost
    a = ttts_as_player_one.where("winner = 2 and player_two_id is null")
    a += ttts_as_player_two.where("winner = 1")
  end  
   def games_all_drawn
    a = ttts_as_player_one.where("winner = 0 and player_two_id is null")
    a += ttts_as_player_two.where("winner = 0")
  end 

  def games_computer
    a = ttts_as_player_one.where("live_game = 'f' and computer = 1")
    
  end

  def games_computer_won
    a = ttts_as_player_one.where("live_game = 'f' and computer = 1 and winner = 1")
    
  end
    def games_computer_lost
    a = ttts_as_player_one.where("live_game = 'f' and computer = 1 and winner =2")
  end
  def games_computer_drawn
    a = ttts_as_player_one.where("live_game = 'f' and computer = 1 and winner =0")
  end

  def games_player_two
    ttts_as_player_one.where("player_two_id is null and computer is null and live_game = 'f'")

  end

  def games_player_two_won
    ttts_as_player_one.where("player_two_id is null and computer is null and live_game = 'f' and winner = 1")
  end
def games_player_two_lost
    ttts_as_player_one.where("player_two_id is null and computer is null and live_game = 'f' and winner = 2")
  end
  def games_player_two_drawn
    ttts_as_player_one.where("player_two_id is null and computer is null and live_game = 'f' and winner = 0")

  end
  def games_user
    a = ttts_as_player_one.where("player_two_id is not null and live_game = 'f'")
    a += ttts_as_player_two.where("live_game = 'f'")
  end

  def games_user_won
      a = ttts_as_player_one.where("player_two_id is not null and live_game = 'f' and winner = 1")
      a += ttts_as_player_two.where("live_game = 'f' and winner = 2")
  end
    def games_user_lost
    a = ttts_as_player_one.where("player_two_id is not null and live_game = 'f' and winner = 2")
      a += ttts_as_player_two.where("live_game = 'f' and winner = 1")
  end
  def games_user_drawn
    a = ttts_as_player_one.where("player_two_id is not null and live_game = 'f' and winner = 0")
    a += ttts_as_player_two.where("live_game = 'f' and winner = 0")

  end
end
