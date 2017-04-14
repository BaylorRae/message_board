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

When(/^(.*) updates their email$/) do |login|
  change_user(login)
  Pages::Users::AccountPage.update_email("#{login}.updated@example.com")
end

Then(/^(.*) should be logged into their account$/) do |login|
  expect(page).to have_content("#{login}@example.com")
end

Then(/^(.*) should have an updated email$/) do |login|
  expect(page).to have_content("#{login}.updated@example.com")
end
