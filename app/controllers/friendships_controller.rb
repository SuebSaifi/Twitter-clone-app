class FriendshipsController < ApplicationController
def index 
  @friendships=User.all
 end
 def new
   @friendship=current_user.friendships.build
   end
 def create
 @friendship=current_user.friendships.build(friend_id: params[:friend_id])

   respond_to do |format|
     if @friendship.save
       format.html { redirect_to root_path, notice: "#{@friendship} User Added To your friend list." }
       format.json { render :show, status: :created, location: @friendship }
     else
       format.html { render :new }
       format.json { render json: @friendship.errors, status: :unprocessable_entity }
     end
   end
 end
 def show
   @friendship=Friendship.find(params[:id])    
   end
   def destroy
     @friendship=Friendship.find(params[:id])
     @friendship.destroy
     flash[:notice] = "Removed friendship."
     redirect_to friendships_url
     
 end
 
end