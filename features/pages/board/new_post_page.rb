module Pages
  module Board
    class NewPostPage < Capybara::PomPom::Page

      field :title_field, "Title"
      field :body_field, "Body"
      button :post_button, "Post"

      def initialize
        visit '/board/posts/new'
      end

      def create_post
        submit_form('My First Post', 'The body of a great new post')
      end

      def create_blank_post
        submit_form('', '')
      end

      private

      def submit_form(title, body)
        within '#new_post' do
          title_field.set(title)
          body_field.set(body)
          post_button.click
        end
      end
    end
  end
end
