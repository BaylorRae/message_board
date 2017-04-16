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
        within '#new_post' do
          title_field.set('My First Post')
          body_field.set('The body of a great new post')
          post_button.click
        end
      end

    end
  end
end
