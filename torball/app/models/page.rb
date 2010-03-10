class Page < ActiveRecord::Base

  # return page set to home
  def self.find_home
    return Page.find_by_home(true)
  end

  # set a page to home
  def set_home
    page = Page.find_by_home(true)
    page.home = false
    page.save
    self.home = true
    self.published = true
    self.save
  end
end
