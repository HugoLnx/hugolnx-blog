class Comment < ActiveRecord::Base
  belongs_to :post, :readonly => true
  belongs_to :user, :readonly => true
  validates_presence_of :post_id
  validates_presence_of :user_id
  validates_presence_of :content
end
