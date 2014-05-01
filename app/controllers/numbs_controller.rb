class NumbsController < ApplicationController
  
  # load_and_authorize_resource

  def show
    @numb = Numb.find(params[:id])
  end
  
  def index
    @numbs = Numb.all
  end
  
  def edit

  end


  def new
    # @numb = Numb.build(userid: current_user.id, 
    #   s1:  0,s2:  0,s3:  0,s4:  0,s5:  0,s6:  0,
    #   s7:  0,s8:  0,s9:  0,s10:  0,s11:  0,s12:  0,
    #   s13:  0,s14:  0,s15:  0,s16:  0)

    # square = rand(16) + 1
    # s = "s" + square.to_i
    
    # @numb.save

    
  end


  def update
    @numb = Numb.find(params[:id])
      @numb.move(params[:dir])
      newsquare = @numb.free_moves.sample
      @numb[newsquare] = 2
      @numb.save

    render 'show'

  end

  def create 
    @numb = Numb.new(user_id: current_user.id, 
       s1:  0,s2:  0,s3:  0,s4:  0,
       s5:  0,s6:  0,s7:  0,s8:  0,
       s9:  0,s10:  0,s11:  0,s12:  0,
       s13:  0,s14:  0,s15:  0,s16:  0, 
       score: 0)
    newsquare = @numb.free_moves.sample
    @numb[newsquare] = 2
    @numb.save
    @numbs = Numb.all
    render 'show'
  end

  def destroy

  end



end
