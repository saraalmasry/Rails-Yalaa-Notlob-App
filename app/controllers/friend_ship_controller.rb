class FriendShipController < ApplicationController
  def index
    @friendShips=FriendShip.all 
    @friendShipsCreatedByCurrentUser= @friendShips.select{|friendShip| 
      friendShip.creator_id == current_user.id
     
    }
    @friendsAddedTheCurrentUse= @friendShips.select{|friendShip| 
      friendShip.myfriend_id == current_user.id
     
    }

    #for testing
    # @friendShipsCreatedByCurrentUser= @friendShips.select{|friendShip| 
    #   friendShip.creator_id == 1
     
    # }
    # @friendsAddedTheCurrentUse= @friendShips.select{|friendShip| 
    #   friendShip.myfriend_id == 1
     
    # }

    @friendsCreatedByCurrentUser=@friendShipsCreatedByCurrentUser.collect do |friendShip|
      
        User.find_by_id!(friendShip.myfriend_id)
        end  
    @friendsAddedTheCurrentUser=  @friendsAddedTheCurrentUse.collect do |friendShip|
      
          User.find_by_id!(friendShip.creator_id)
        end  
    @friends = @friendsCreatedByCurrentUser  +  @friendsAddedTheCurrentUser
          

         
     
  end

  def create
   
    if User.exists?(email: params[:email])
       @creator_id= current_user.id
      #for testing 
      
      #  @creator_id= 1
      @myfriend_id=User.find_by_email!(params[:email]).id
      @friend_ship=FriendShip.new( creator_id: @creator_id,myfriend_id: @myfriend_id)
      if FriendShip.where(creator_id: @creator_id,myfriend_id: @myfriend_id).exists? ||
        FriendShip.where(creator_id:  @myfriend_id ,myfriend_id: @creator_id).exists?
        flash[:danger] = "this friend already exists"
        redirect_to :action => "index"
      else 

        if @friend_ship.save
          puts "ok"
          flash[:success] = "Your friend has been added."
          redirect_to :action => "index"
        else 
          puts "no"
          flash[:danger] = "an error happened please try again"
          redirect_to :action => "index"
        end
        @friend_ship.errors.full_messages 



      end   
      
    else
      flash[:danger] = "this email does not exist"
      redirect_to :action => "index"
    end   
    #  puts params[:email]

  end  


  def destroy
    
    @friendShipsCreatedByFriend = FriendShip.find_by_creator_id(params[:id])
    @friendShipsCreatedByCurrentUser = FriendShip.find_by_myfriend_id(params[:id])
    if  @friendShipsCreatedByFriend
        @friendShipsCreatedByFriend.destroy
        if @friendShipsCreatedByFriend.destroy 
          puts " @friendShipsCreatedByFriend deleted"
          flash[:success] = "This friend has been removed successfully from your friends list "
        else
          puts " @friendShipsCreatedByFriend not deleted"  
          flash[:danger] = "an error happened please try again"
        end   
    end 
    if @friendShipsCreatedByCurrentUser
        @friendShipsCreatedByCurrentUser.destroy
        if @friendShipsCreatedByCurrentUser.destroy 
          puts " @friendShipsCreatedByCurrentUser deleted"
          flash[:success] = "This friend has been removed successfully from your friends list "
        else
          puts " @friendShipsCreatedByCurrentUser deleted"  
          flash[:danger] = "an error happened please try again"
        end  
    end

   

    


  
    redirect_to :action => "index"


  end    
end