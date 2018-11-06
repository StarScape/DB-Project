class HomePageController < ApplicationController

  def index
    if !session[:da_id]
      redirect_to controller: 'sessions', action: 'new'
    else
      @da = DA.find(session[:da_id])
    end

  end
end
