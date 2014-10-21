class AddSlugToPostAndTag < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string, unique: true
    add_column :tags, :slug, :string, unique: true
  end
end
