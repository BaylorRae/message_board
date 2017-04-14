class PostListing < ActiveRecord::Base
  self.primary_key = :id

  default_scope { order(:created_at) }

  belongs_to :user
  has_many :messages, class_name: 'PostMessage', foreign_key: :post_id

  private

  def readonly?
    true
  end
end
