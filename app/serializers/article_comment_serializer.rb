class ArticleCommentSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :comment, :date_of_comment
end
