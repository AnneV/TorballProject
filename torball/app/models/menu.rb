class Menu < ActiveRecord::Base

  validates_presence_of :name
  has_many :links
  belongs_to :link

end
