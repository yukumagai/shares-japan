class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduce
      t.string :image
      t.integer :date

      t.timestamps null: false
    end
  end
end
