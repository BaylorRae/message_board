class PagesController < ApplicationController
  def home
    @posts = PostListing
      .includes(:messages => :user)
      .where('last_message_number is null or post_messages.message_number > last_message_number - 3')
      .order('post_messages.created_at desc')
  end
end
