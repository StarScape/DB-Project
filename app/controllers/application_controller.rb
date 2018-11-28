class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def confirm_signed_in
    if session[:da_id].nil?
      redirect_to '/login'
    end
  end
end
