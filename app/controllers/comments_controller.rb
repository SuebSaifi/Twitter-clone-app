class CommentsController < ApplicationController
    # before_action :set_tweeet
    def index
        @comments=Comment.all    
        @tweeets=Tweeet.all
    end
    
    def new
        @comment=current_user.comments.build
        respond_to do |format|
                format.html
                format.js
              end
    end
    
    def show
        @comment = Comment.find(params[:id])
    end
    
    def create
    @tweeet=Tweeet.find(params[:tweeet_id])
        @comment = @tweeet.comments.build(comment_params)
        respond_to do |format|
        if @comment.save
            format.html{ redirect_to @tweeet}
            # format.js
            
          else
            flash[:error] = "Something went wrong"
            render 'new'
          end
        end 
        end
     
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to @tweeet    }
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end
    
    
    
    private
    
    # def set_tweeet
    #     @tweeet=Tweeet.find(params[:id])
    # end
    
    def comment_params
        params.require(:comment).permit(:comment,:user_id)
    end
    
end
