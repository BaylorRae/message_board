When(/^(.*) creates an account$/) do |login|
  Pages::Users::RegisterPage.create_account(login + '@example.com')
end

Then(/^(.*) should be logged into their account$/) do |login|
  expect(page).to have_content("Welcome #{login}@example.com")
end
