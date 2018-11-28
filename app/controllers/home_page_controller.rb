class HomePageController < ApplicationController
  before_action :confirm_signed_in

  def index
    @da = DA.find(session[:da_id])
  end
end
