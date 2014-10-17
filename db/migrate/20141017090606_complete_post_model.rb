class CompletePostModel < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :status, :integer
    add_column :posts, :type, :integer
  end
end
