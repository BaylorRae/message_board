class CreatePostListings < ActiveRecord::Migration
  def change
    create_view :post_listings
  end
end
