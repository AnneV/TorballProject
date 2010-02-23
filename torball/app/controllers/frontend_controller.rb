class FrontendController < ApplicationController

  layout "frontend"

  def home
    @page = Page.find_by_home(true)
    @menus = Menu.all(:conditions => {:published => true})
  end

  def show
    @page = Page.find_by_id(params[:id])
    @menus = Menu.all(:conditions => {:published => true})
  end

end
