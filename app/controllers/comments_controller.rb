class CommentsController < ApplicationController
  def new
    @post = Post.find_by_id(params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.parent_comment_id = params[:comment][:parent_comment_id] ||= nil
    @comment.post_id = params[:post_id] ||= @comment.parent_comment.post_id
    if @comment.save!
      redirect_to post_url(params[:post_id])
    else
      redirect_to new_post_comment_url(params[:post_id])
    end
  end

  def show
    @post = Post.find_by_id(params[:post_id])
    @parent_comment = Comment.find_by_id(params[:id])
    render :show
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
