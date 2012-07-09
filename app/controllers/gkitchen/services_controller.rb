
class Gkitchen::ServicesController < GkitchenController
  
  before_filter :checksession
  
  def ingredientslist
    @gingredients = Gingredient.all
    respond_to do |format|
      format.json { render :json => @gingredients}  
    end
  end
  
  private
  def checksession
  
  end  
end