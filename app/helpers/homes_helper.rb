module HomesHelper
  def welcome_message
      last_message =  current_user.moves.order(:created_at).last 
      timediff = (Time.now - last_message.created_at).to_i
      
      if timediff / 60  < 60
        return "You're back already!  It's been less than an hour since your last game."
      elsif (timediff /60 / 60) < 24
        return "Back again today. Nice work."
      else
        return "It's been a while."
      end
  end  
end