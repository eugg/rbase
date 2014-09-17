class AddDeletedAtToUserSocials < ActiveRecord::Migration
  def change
    add_column :user_socials, :deleted_at, :datetime
    add_index :user_socials, :deleted_at
  end
end
