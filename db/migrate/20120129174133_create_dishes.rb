class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title,:null=>false
      t.string :alpha_desc,:null=>true
      t.integer :tray,:default=>0

      t.timestamps
    end
  end
end
