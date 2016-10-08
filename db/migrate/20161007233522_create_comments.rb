class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.integer :parent_comment_id, index:true
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end
