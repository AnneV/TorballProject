# This model deals with links. i
# A link is attached to a menu. A menu has many links. A (sub) menu can
# created by linking a menu to a link. There can be only one submenu per link.
#
# Created March 2010
# By Nelle Varoquaux

# TODO right now, a link has to have a page attached. In the future, we might
# want to create submenu linked to a link with no page attached to this same
# link (Basically, there are two user stories different)
#    1. The user clicks on link A: a page & a submenu appear
#    2. The user hovers on a link, a submenu appears. This link can not be
#    clicable.


# TODO Pages linked to links should be published.

class Link < ActiveRecord::Base
  belongs_to :menu 
  belongs_to :page
  has_one :submenu, :class_name => 'Menu'
  validates_presence_of :page


  def before_destroy
    # unlink all submenus to this link
    self.submenu.link_id = nil
    self.submenu.save
  end
end
