module UserManager
  def change_user(login)
    @created_accounts ||= []

    email = "#{login}@example.com"
    return if @current_email == email

    @current_email = email

    if @created_accounts.include?(email)
      return Pages::Users::LoginPage.log_in(email)
    end

    page.driver.submit :delete, "/users/sign_out", {}

    @created_accounts << email
    Pages::Users::RegisterPage.create_account(email)
  end
end

World(UserManager)
