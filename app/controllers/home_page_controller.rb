class HomePageController < ApplicationController

  def index
    if !session[:da_id]
      redirect_to controller: 'sessions', action: 'new'
    end
  end
end
