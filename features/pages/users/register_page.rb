module Pages
  module Users
    class RegisterPage < Capybara::PomPom::Page

      field :email_field, "Email"
      field :password_field, "Password"
      field :password_confirmation_field, "Password confirmation"
      button :register_button, "Sign up"

      def initialize
        visit '/users/sign_up'
      end

      def create_account(email, password = 'secret')
        email_field.set(email)
        password_field.set(password)
        password_confirmation_field.set(password)
        register_button.click
      end
    end
  end
end
