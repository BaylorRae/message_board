class Post < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :post_messages

  validates_presence_of :title

  accepts_nested_attributes_for :messages, reject_if: :all_blank

  def self.new_with_message
    post = new
    post.messages.build
    post
  end
end
