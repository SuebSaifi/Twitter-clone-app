class LikesController < ApplicationController
    before_action :set_tweeet,:find_like ,only: :destroy
    def create
        if already_like?
            flash[:notice]="You canot like"            
        else
        @like = Like.create(tweeet_id: params[:tweeet_id] ,user_id: current_user.id)
        redirect_to root_path
        end
    end
    def destroy 
        # @like=@tweeet.likes.find(params[:id])
        # if !(already_liked?)
        #   flash[:notice] = "Cannot unlike"
        # else
          @like.destroy
          redirect_to root_path
        # end
      end
    private
    
    def set_tweeet
        @tweeet=Tweeet.find(params[:tweeet_id])
    end
    def find_like
        @like=@tweeet.likes.find(params[:id])
    end
    
    def already_like?
        Like.where(user_id:current_user.id,tweeet_id:params[:tweeet_id]).exists?
    end

end
