class PostSerializer < ActiveModel::Serializer
  attributes :title, :body

  has_many :comments
end
