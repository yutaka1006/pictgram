class CommentsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @comment = Comment.new 
    @topic_id = params[:topic_id]
  end

  def  create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:id]
   
    if @comment.save
     redirect_to topics_path, success: 'コメントしました'
    else
     flash.now[:danger] = 'コメントに失敗しました'
     render :new
    end
  end 

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
