class CreateGnoodlerecipes < ActiveRecord::Migration
  def change
    create_table :gnoodlerecipes do |t|
      t.string :title
      t.string :alpha_desc
      t.text :long_desc

      t.timestamps
    end
  end
end
