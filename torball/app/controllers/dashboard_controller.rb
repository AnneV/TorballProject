class DashboardController < ApplicationController


  before_filter :login_required
  layout "backend"

  def index
  
  end 


end
