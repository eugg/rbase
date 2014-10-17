class CreatePostRelations < ActiveRecord::Migration
  def change
    create_table :post_relations do |t|
      t.integer :post_id
      t.integer :tag_id
      t.integer :type

      t.timestamps
    end
  end
end
