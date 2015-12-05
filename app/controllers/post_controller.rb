class PostController < ApplicationController
  def index
    render json: Post.take(5)
  end

  def show
    render json: Post.find(params[:id])
  end
end
