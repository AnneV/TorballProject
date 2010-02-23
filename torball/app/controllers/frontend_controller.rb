class FrontendController < ApplicationController

  layout "frontend"

  def home
    @menus = Menu.find_by_published(true)
    @page = Page.find_by_home(true)
  end

  def show
    @menu = Menu.find_by_published(true)
    @page = Page.find_by_id(params[:id])
  end

end
