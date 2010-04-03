class FrontendController < ApplicationController

  layout "frontend"

  def home
    @page = Page.find_by_home(true)
    @menus = Menu.all(:conditions => {:published => true})
    cat_news = Category.find_by_name('News')
    cat_editorial = Category.find_by_name('Editorial')
    @news = Post.all(:conditions => {:category_id => cat_news.id, 
                                     :published => true}, 
                    :order => :created_at,
                    :limit => 3)
    @editos = Post.all(:conditions => {:category_id => cat_editorial.id, 
                                     :published => true}, 
                    :order => :created_at,
                    :limit => 3)
  end

  def show
    @page = Page.find_by_id(params[:id])
    @menus = Menu.all(:conditions => {:published => true})
  end

  def edito
    @post = Post.find_by_id(params[:id])
    @menus = Menu.all(:conditions => {:published => true})
  end

end
