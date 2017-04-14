module Pages
  module Users
    class AccountPage < Capybara::PomPom::Page

      field :email_field, "Email"
      button :save_button, "Save Changes"

      def initialize
        visit '/account'
      end

      def update_email(email)
        email_field.set(email)
        save_button.click
      end

    end
  end
end
