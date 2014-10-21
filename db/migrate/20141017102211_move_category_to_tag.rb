class MoveCategoryToTag < ActiveRecord::Migration
  def change
    add_column :tags, :type, :integer
    remove_column :post_relations, :type
  end
end
