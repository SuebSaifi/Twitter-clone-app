class CommentsController < ApplicationController
    # before_action :set_tweeet
    def index
        @comments=Comment.all    
        @tweeets=Tweeet.all
    end
    
    def new
        @comment=current_user.comments.build
    end
    
    def show
        @comment = Comment.find(params[:id])
    end
    
    def create
    @tweeet=Tweeet.find(params[:tweeet_id])
        @comment = @tweeet.comments.build(comment_params)
        respond_to do |format|
        if @comment.save
            flash[:success] = "comment successfully created"
            format.js
            redirect_to root_path
          else
            flash[:error] = "Something went wrong"
            render 'new'
          end
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
