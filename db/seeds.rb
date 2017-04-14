# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ADJECTIVES = %w(salty sweet happy sad cheerful spooky).freeze
NOUNS      = %w(apples bananas car squid walrus cheese).freeze

users = User.create!([
  { email: 'bob@example.com', password: 'secret' },
  { email: 'alice@example.com', password: 'secret' },
  { email: 'leo@example.com', password: 'secret' }
])

posts = users.map { |user| Post.create!(title: "#{ADJECTIVES.sample}-#{NOUNS.sample}-#{Random.rand(100) * 77}", user: user) }

posts.each do |post|
  ActiveRecord::Base.transaction do
    15.times do |i|
      time = i.minutes.ago
      post.messages.create!(user: users.sample, body: ADJECTIVES.sample(2).join(' ') + ' ' + NOUNS.sample, created_at: time, updated_at: time)
    end
  end
end
