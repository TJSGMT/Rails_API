class AddCommmentRefToArticle < ActiveRecord::Migration[7.0]
  def change
   add_reference :article_comments, :article
  end
end
