class V1::PostsController < V1::BaseController
  def index
    render json: Post.take(10)
  end

  def show
    render json: Post.find(params[:id])
  end
end
