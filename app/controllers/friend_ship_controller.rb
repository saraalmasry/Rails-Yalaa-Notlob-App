class FriendShipController < ApplicationController
  def index
  end

  def create
   
    if User.exists?(email: params[:email])
      # @creator_id= current_user.id
      #for testing 
      
       @creator_id= 1
      @myfriend_id=User.find_by_email!(params[:email]).id
      @friend_ship=FriendShip.new( creator_id: @creator_id,myfriend_id: @myfriend_id)
      if @friend_ship.save
        puts "ok"
      else 
        puts "no"
      end
      @friend_ship.errors.full_messages    
    end   
    #  puts params[:email]

  end  
end
