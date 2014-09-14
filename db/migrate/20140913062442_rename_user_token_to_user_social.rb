class RenameUserTokenToUserSocial < ActiveRecord::Migration
  def change
    rename_table :user_tokens, :user_socials
  end
end
