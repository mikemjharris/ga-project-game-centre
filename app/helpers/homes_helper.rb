module HomesHelper
  def welcome_message
      
    if current_user.moves.any?
     
    
      last_message =  current_user.moves.order(:created_at).last 
      timediff = (Time.now - last_message.created_at).to_i
      
      if timediff / 60  < 60
        return "You're back already!  It's been less than an hour since your last game."
      elsif (timediff /60 / 60) < 24
        return "Back again today. Nice work."
      else
        return "It's been a while."
      end
    else
     return "You haven't played a game yet - jump right in!"
    end
  end  
end