class CreateArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comments do |t|
      t.string :comment
      t.string :date_of_comment

      t.timestamps
    end
  end
end
