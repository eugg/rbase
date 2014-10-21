class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name_zh
      t.string :name_en

      t.timestamps
    end
  end
end
