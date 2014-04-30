class HomesController < ApplicationController
  layout "home"
  
  def index
     if current_user
        @noleftmenu = true
        render 'index', layout: 'application'

     else 
        render 'login_index', layout: 'home'

      end
  end

end
