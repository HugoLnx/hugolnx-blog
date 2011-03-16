class Comment < ActiveRecord::Base
  belongs_to :post, :readonly => true
  validates_presence_of :author
  validates_presence_of :content
  validates_presence_of :post_id
end
