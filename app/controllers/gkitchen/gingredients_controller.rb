require 'will_paginate/active_record'

class Gkitchen::GingredientsController < GkitchenController
 
 layout 'ajax'
 
  def index
    index_columns ||= [:id,:api_name]
    current_page = params[:page] ? params[:page].to_i : 1
    rows_per_page = params[:rows] ? params[:rows].to_i : 10

    conditions={:page => current_page, :per_page => rows_per_page}
    conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    if params[:_search] == "true"
      conditions[:conditions]=filter_by_conditions(index_columns)
    end
    
    @gingredients = Gingredient.paginate(conditions)
    total_entries = @gingredients.total_entries
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @gingredients.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    end
  end

  
  def show
    @gkitchen_gingredient = Gkitchen::Gingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gkitchen_gingredient }
    end
  end

  
  def new
    @gkitchen_gingredient = Gingredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gkitchen_gingredient }
    end
  end

  
  def edit
    @gkitchen_gingredient = Gkitchen::Gingredient.find(params[:id])
  end

  
  def create
    @gkitchen_gingredient = Gkitchen::Gingredient.new(params[:gkitchen_gingredient])

    respond_to do |format|
      if @gkitchen_gingredient.save
        format.html { redirect_to @gkitchen_gingredient, notice: 'Gingredient was successfully created.' }
        format.json { render json: @gkitchen_gingredient, status: :created, location: @gkitchen_gingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @gkitchen_gingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @gkitchen_gingredient = Gkitchen::Gingredient.find(params[:id])

    respond_to do |format|
      if @gkitchen_gingredient.update_attributes(params[:gkitchen_gingredient])
        format.html { redirect_to @gkitchen_gingredient, notice: 'Gingredient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gkitchen_gingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @gkitchen_gingredient = Gkitchen::Gingredient.find(params[:id])
    @gkitchen_gingredient.destroy

    respond_to do |format|
      format.html { redirect_to gkitchen_gingredients_url }
      format.json { head :ok }
    end
  end
end
