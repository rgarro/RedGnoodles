#cars2
#legostarwar

require 'gdata'

class GkitchenController < ActionController::Base
  layout 'kitchen'
  protect_from_forgery
  before_filter :is_auth, :except => [:login,:checklogin]
  
 def login
  
  end

  def checklogin    
   login =  params[:login]     
   if login[:email].length.to_i > 0
      
      if manager = Manager.find_by_email(params[:login][:email]) 
        if params[:login][:password] == manager.password
          session[:admin_pass] = true
          redirect_to(:action=>"homeb")
        else
          redirect_to(:action=>"login",:notice=>"invalid password!")  
        end
      else       
        redirect_to(:action=>"login",:notice=>"invalid email!")  
      end
    else
      redirect_to(:action=>"login",:notice=>"email required!")
    end
  
  end

  def logout
    session[:admin_pass] = false
    redirect_to(:action=>"login")
  end

  def home
  end
  
  def homeb
    #@js_files = ['gnoodleApp.js','gNoodleCtl.js','angular/angular-resource.js']
  end
  
  def gingredients
    render :layout=>'ajax'
  end
  
  def gnoodlerecipes
    render :layout=>'ajax'
  end
  
  private
  def is_auth
   if session[:admin_pass] != true
    redirect_to(:action=>"login",:controller=>"admin")
   end 
  end
  
end