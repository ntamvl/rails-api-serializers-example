class V1::PostsController < V1::BaseController
  def index
    render json: Post.order(id: :desc).take(5)
  end

  def show
    render json: Post.find(params[:id])
  end
end
