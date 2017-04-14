class Post < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :post_messages

  accepts_nested_attributes_for :messages, reject_if: :all_blank
end
