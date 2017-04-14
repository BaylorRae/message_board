Given(/^(.*) has created a thread$/) do |login|
  steps %Q{
    When #{login} creates a new thread
  }
end

When(/^(.*) creates a new thread$/) do |login|
  change_user(login)
  Pages::Board::NewPostPage.create_post
end

When(/^(.*) replies$/) do |login|
  change_user(login)

  last_thread = Post.last
  visit board.post_path(last_thread.id)

  Pages::Board::ThreadPage.post_reply
end

Then(/^the new post should be created$/) do |table|
  thread_page = Pages::Board::ThreadPage.new
  latest_post = thread_page.latest_post

  expected_post = table.hashes.first

  expect(thread_page.title).to eq(expected_post[:title])
  expect(latest_post.body).to eq(expected_post[:body])
  expect(latest_post.author).to eq(expected_post[:author] + '@example.com')
end
