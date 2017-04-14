class PostListing < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :user
  has_many :messages, class_name: 'PostMessage', foreign_key: :post_id

  private

  def readonly?
    true
  end
end
