class Message < ActiveRecord::Base
  attr_accessible :user_id, :message, :to_user, 
    :type, :read, :to_user_id, :title

  belongs_to :user
  
  
  belongs_to :to_user, class_name: 'User'

end
