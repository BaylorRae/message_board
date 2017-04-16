class Post < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :post_messages

  def self.new_with_message
  end
end
