class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end
	def create
		@comment = Comment.new comment_params
        if @comment.save
            flash[:success] = "Micropost created!"
            redirect_to :back
        else
            render 'new'
        end
  end
 	def show
 		@comment = Comment.find(params[:id])
 	end
  private
    def comment_params
      	params.require(:comment).permit(:micropost_id, :comment, :user_id)
    end
end
