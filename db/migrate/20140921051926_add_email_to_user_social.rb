class AddEmailToUserSocial < ActiveRecord::Migration
  def change
    add_column :user_socials, :email, :string
  end
end
