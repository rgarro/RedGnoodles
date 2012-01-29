class CreateGnoodles < ActiveRecord::Migration
  def change
    create_table :gnoodles do |t|
      t.string :resource_key,:null=>false
      t.string :alpha_desc,:null=>true
      t.references :gnoodleportion
      t.references :gitem

      t.timestamps
    end
    add_index :gnoodles, :gnoodleportion_id
    add_index :gnoodles, :gitem_id
  end
end
