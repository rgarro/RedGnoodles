class CreateGitems < ActiveRecord::Migration
  def change
    create_table :gitems do |t|
      t.string :title,:null=>false
      t.string :alpha_desc,:null=>true
      t.integer :sort,:default=>0
      t.boolean :required,:default=>false
      t.references :gingredient
      t.references :gnoodlerecipe

      t.timestamps
    end
    add_index :gitems, :gingredient_id
    add_index :gitems, :gnoodlerecipe_id
  end
end
