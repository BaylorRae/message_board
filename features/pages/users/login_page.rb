module Pages
  module Users
    class LoginPage < Capybara::PomPom::Page

      field :email_field, "Email"
      field :password_field, "Password"
      button :login_button, "Log in"

      def initialize
        visit '/users/sign_in'
      end

      def log_in(email, password = 'secret')
        email_field.set(email)
        password_field.set(password)
        login_button.click
      end
    end
  end
end
