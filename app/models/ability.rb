class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      
    case user.role

        when "admin"
            can :manage, :all

      else 
            # can :read, :all
            can :new, Ttt   #authorise create a new game

            can :show,  Ttt do |ttt|
                ttt.check_user_playing?(user.id)

            end

            
    
    end
  end
end