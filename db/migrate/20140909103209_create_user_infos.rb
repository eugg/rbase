class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :username
      t.integer :user_id, unique: true
      t.integer :gender
      t.date :birthday
      t.text :bio
      t.string :address
      t.string :avatar

      t.timestamps
    end
  end
end
