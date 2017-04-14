Given(/^(.*) has logged in$/) do |login|
  change_user(login)
end

Given(/^(.*) has created an account$/) do |login|
  User.create!(email: login + '@example.com', password: 'secret')
end

When(/^(.*) creates an account$/) do |login|
  Pages::Users::RegisterPage.create_account(login + '@example.com')
end

When(/^(.*) logs into their account$/) do |login|
  Pages::Users::LoginPage.log_in(login + '@example.com')
end

Then(/^(.*) should be logged into their account$/) do |login|
  expect(page).to have_content("Welcome #{login}@example.com")
end
