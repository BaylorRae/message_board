class PostMessage < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :post
  belongs_to :user

  private

  def readonly?
    true
  end
end
