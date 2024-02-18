class CreatePostPostComments < ActiveRecord::Migration[7.1]
  def change
    create_table :post_post_comments do |t|
      t.string :body
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
