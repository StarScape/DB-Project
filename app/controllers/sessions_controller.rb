class SessionsController < ApplicationController
  def new
    if session[:da_id]
      redirect_to root_url
    end
  end

  def create
    da = DA.find_by(email: params[:session][:email].downcase)
    
    if da && da.authenticate(params[:session][:password])
      session[:da_id] = da.id
      redirect_to root_url
    else
      flash[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    session[:da_id] = nil
    redirect_to root_url    
  end
end
