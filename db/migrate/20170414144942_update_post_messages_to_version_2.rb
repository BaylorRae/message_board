class UpdatePostMessagesToVersion2 < ActiveRecord::Migration
  def change
    update_view :post_messages, version: 2, revert_to_version: 1
  end
end
