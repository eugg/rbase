class ChangeColumnNamedType < ActiveRecord::Migration
  def change
    rename_column :posts, :type, :post_type
    rename_column :tags, :type, :tag_type
  end
end
