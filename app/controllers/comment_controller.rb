class CommentController < ApplicationController
  def index
    render json: Comment.take(10)
  end

  def show
    render json: Comment.find(params[:id])
  end
end
