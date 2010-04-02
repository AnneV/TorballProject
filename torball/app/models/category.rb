# categories define where the posts should be displayed: news, editorials ?

# created April, 2010
# author Nelle Varoquaux


class Category < ActiveRecord::Base

  has_many :posts

end
