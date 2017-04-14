Given(/^several posts and messages have been created$/) do
  # create 3 users
  # 2 posts for each user
  # 15 messages for each post

  ADJECTIVES = %w(salty sweet happy sad cheerful spooky).freeze
  NOUNS      = %w(apples bananas car squid walrus cheese).freeze

  users = User.create!([
    { email: 'bob@example.com', password: 'secret' },
    { email: 'alice@example.com', password: 'secret' },
    { email: 'leo@example.com', password: 'secret' }
  ])

  posts = []

  ActiveRecord::Base.transaction do
    posts = users.map do |user|
      Post.create!([
        {title: "#{ADJECTIVES.sample}-#{NOUNS.sample}-#{Random.rand(100) * 77}", user: user},
        {title: "#{ADJECTIVES.sample}-#{NOUNS.sample}-#{Random.rand(100) * 77}", user: user}
      ])
    end
  end

  posts.flatten.each do |post|
    ActiveRecord::Base.transaction do
      15.times do |i|
        time = i.minutes.ago
        post.messages.create!({
          user: users.sample,
          body: ADJECTIVES.sample(2).join(' ') + ' ' + NOUNS.sample,
          created_at: time,
          updated_at: time
        })
      end
    end
  end
end

Then(/^the homepage should display a summary of each post$/) do
  home_page = home_page = Pages::HomePage.new

  # show all threads
  expect(home_page.threads.length).to eq(6)

  # only show last 3 posts
  home_page.threads.each do |thread|
    expect(thread.posts.length).to eq(3)
  end
end
