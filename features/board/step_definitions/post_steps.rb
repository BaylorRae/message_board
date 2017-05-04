Given(/^(.*) has created a thread$/) do |login|
  steps %Q{
    When #{login} creates a new thread
  }
end

When(/^(.*) creates a new thread$/) do |login|
  change_user(login)
  Pages::Board::NewPostPage.create_post
end

When(/^(.*) creates a blank thread$/) do |login|
  change_user(login)
  Pages::Board::NewPostPage.create_blank_post
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

  expect(thread_page.thread_title.text).to eq(expected_post[:title])
  expect(latest_post.body.text).to eq(expected_post[:body])
  expect(latest_post.author.text).to eq(expected_post[:author] + '@example.com')
end

Then(/^an error should be shown for missing post fields$/) do
  expect(page).to have_content('The following errors prevented us from creating your post')
  expect(page).to have_content("Title can't be blank")
  expect(page).to have_content("Messages body can't be blank")
end
