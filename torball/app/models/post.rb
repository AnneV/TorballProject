# created April, 2010
# author: Nelle Varoquaux

# TODO link to author


class Post < ActiveRecord::Base

  belongs_to :category
  validates_presence_of :category_id

end
