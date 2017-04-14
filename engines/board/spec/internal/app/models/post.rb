class Post < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :post_messages
end
