class CreatePostMessages < ActiveRecord::Migration
  def change
    create_view :post_messages
  end
end
