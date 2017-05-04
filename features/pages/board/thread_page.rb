require './features/snippets/board/thread_post_snippet'

module Pages
  module Board
    class ThreadPage < Capybara::PomPom::Page

      css :thread_title, ".thread-title"
      field :reply_field, "Body"
      button :reply_button, "Post"

      components :posts, ".message", wrapper: Pages::Snippets::Board::ThreadPostSnippet

      def post_reply
        within '#new_message' do
          reply_field.set('This is a response to a great thread')
          reply_button.click
        end
      end

      def first_post
        posts.first
      end

      def latest_post
        posts.last
      end

    end
  end
end
