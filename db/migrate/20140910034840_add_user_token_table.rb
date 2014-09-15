class AddUserTokenTable < ActiveRecord::Migration
  def change
    create_table :user_socials do |t|
      t.string :provider
      t.integer :user_id, unique: true
      t.string :uid
      t.string :token
      t.integer :expire_date
      t.datetime :last_sign_in_at
      t.timestamps
    end
  end
end
