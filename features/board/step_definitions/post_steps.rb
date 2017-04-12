When(/^(.*) creates a new post$/) do |login|
  steps %Q{
    Given #{login} has logged in
  }

  Pages::Board::NewPostPage.create_post
end

Then(/^the new post should be created$/) do |table|
  home_page = Pages::Board::ThreadPage.new
  latest_post = home_page.first_post

  expected_post = table.hashes.first

  expect(latest_post.title).to eq(expected_post[:title])
  expect(latest_post.body).to eq(expected_post[:body])
  expect(latest_post.author).to eq(expected_post[:author] + '@example.com')
end
