class Post < ActiveRecord::Base
  has_many :messages
end
