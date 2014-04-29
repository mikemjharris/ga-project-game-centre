class HomesController < ApplicationController
  layout "home"
  
  def index
     if current_user
        render 'index', layout: 'application'

     else 
        render 'index', layout: 'home'

      end
  end

end
