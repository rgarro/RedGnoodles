class Addingredients < ActiveRecord::Migration
  def up
    Gingredient.create(:api_name=>'Base')
    Gingredient.create(:api_name=>'Blogger')
    Gingredient.create(:api_name=>'YouTube')
    Gingredient.create(:api_name=>'Spreadsheets')
    Gingredient.create(:api_name=>'GMail')
    Gingredient.create(:api_name=>'Photos')    
  end

  def down
  end
end
