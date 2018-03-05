class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.picture, notice: 'Review was successfully created.' }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :picture_id)
  end
end
