class MitablesController < ApplicationController
  respond_to :html,:json
  
  protect_from_forgery :except => [:post_data]
  
  # Don't forget to edit routes if you're using RESTful routing
  # 
  #resources :mitables,:only => [:index] do
  #   collection do
  #     post "post_data"
  #   end
  # end

  def post_data
    message=""
    mitable_params = { :id => params[:id],:name => params[:name] }
    case params[:oper]
    when 'add'
      if params["id"] == "_empty"
        mitable = Mitable.create(mitable_params)
        message << ('add ok') if mitable.errors.empty?
      end
      
    when 'edit'
      mitable = Mitable.find(params[:id])
      message << ('update ok') if mitable.update_attributes(mitable_params)
    when 'del'
      Mitable.destroy_all(:id => params[:id].split(","))
      message <<  ('del ok')
    when 'sort'
      mitables = Mitable.all
      mitables.each do |mitable|
        mitable.position = params['ids'].index(mitable.id.to_s) + 1 if params['ids'].index(mitable.id.to_s) 
        mitable.save
      end
      message << "sort ak"
    else
      message <<  ('unknown action')
    end
    
    unless (mitable && mitable.errors).blank?  
      mitable.errors.entries.each do |error|
        message << "<strong>#{Mitable.human_attribute_name(error[0])}</strong> : #{error[1]}<br/>"
      end
      render :json =>[false,message]
    else
      render :json => [true,message] 
    end
  end
  
  
  def index
    index_columns ||= [:id,:name]
    current_page = params[:page] ? params[:page].to_i : 1
    rows_per_page = params[:rows] ? params[:rows].to_i : 10

    conditions={:page => current_page, :per_page => rows_per_page}
    conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    if params[:_search] == "true"
      conditions[:conditions]=filter_by_conditions(index_columns)
    end
    
    @mitables=Mitable.paginate(conditions)
    total_entries=@mitables.total_entries
    
    respond_with(@mitables) do |format|
      format.json { render :json => @mitables.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    end
  end

end