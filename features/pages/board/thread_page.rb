module Pages
  module Board
    class ThreadPage < Capybara::PomPom::Page

      field :reply_field, "Body"
      button :reply_button, "Post"

      def post_reply
        reply_field.set('This is a response to a great thread')
        reply_button.click
      end

      def title
        find('.thread-title').text
      end

      def first_post
        post = posts.first
        Pages::Snippets::Board::ThreadPostSnippet.new(post)
      end

      def latest_post
        post = posts.last
        Pages::Snippets::Board::ThreadPostSnippet.new(post)
      end

      private
      
      def posts
        find_all('.post')
      end

    end
  end
end
