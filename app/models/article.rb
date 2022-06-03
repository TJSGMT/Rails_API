class Article < ApplicationRecord
  has_many :article_comments, dependent: :destroy
end
