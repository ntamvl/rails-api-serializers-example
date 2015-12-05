class CommentSerializer < ActiveModel::Serializer
  attributes :body, :id, :post_id, :post_data

  # has_one :post

  def post_data
    object.post
  end
end
