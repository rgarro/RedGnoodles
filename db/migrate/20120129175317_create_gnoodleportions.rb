class CreateGnoodleportions < ActiveRecord::Migration
  def change
    create_table :gnoodleportions do |t|
      t.string :legend,:null=>false
      t.references :dish
      t.references :gnoodlerecipe

      t.timestamps
    end
    add_index :gnoodleportions, :dish_id
    add_index :gnoodleportions, :gnoodlerecipe_id
  end
end
