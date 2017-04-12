class Post < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  accepts_nested_attributes_for :messages, reject_if: :all_blank
end
