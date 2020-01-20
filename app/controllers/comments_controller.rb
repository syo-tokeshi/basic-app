class CommentsController < ApplicationController


  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    post = Post.find_by(params[:post_id])
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.delete
    redirect_to post_path(post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
