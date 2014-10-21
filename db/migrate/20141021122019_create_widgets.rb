class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :title
      t.text :content
      t.integer :widget_type
      t.string :link
      t.integer :order
      t.timestamps
    end
  end
end
