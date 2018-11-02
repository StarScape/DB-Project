class SessionsController < ApplicationController
  
  def new
  end

  def create
    da = DA.find_by(email: params[:session][:email].downcase)
    
    if da
      puts "LOGGED IN"
      session[:da_id] = da.id
      redirect_to '/'
    else
      flash[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    
  end
end
