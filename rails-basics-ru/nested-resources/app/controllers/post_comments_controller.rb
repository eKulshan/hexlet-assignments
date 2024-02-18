# frozen_string_literal: true

class PostCommentsController < ApplicationController
  before_action :set_post, only: [:create]
  def create
    @post_comment = @post.post_comments.build(post_comment_params)
    if @post_comment.save
      redirect_to @post, notice: 'Post comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post_comment = PostComment.find params[:id]

    @post_comment.destroy

    redirect_to post_path(@post_comment.post), notice: 'Comment was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end
