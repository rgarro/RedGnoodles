class CreateGingredients < ActiveRecord::Migration
  def change
    create_table :gingredients do |t|
      t.string :api_name,:null=>false

      t.timestamps
    end
  end
end
