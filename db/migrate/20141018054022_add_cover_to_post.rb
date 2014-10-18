class AddCoverToPost < ActiveRecord::Migration
  def change
    add_column :posts, :cover, :string
  end
end
