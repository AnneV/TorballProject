class Link < ActiveRecord::Base
  belongs_to :menu
  belongs_to :page
  validates_presence_of :page
end
