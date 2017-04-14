module Pages
  module Board
    class ThreadPage < Capybara::PomPom::Page

      def title
        find('.thread-title').text
      end

      def first_post
        post = find('.post')
        Pages::Snippets::Board::ThreadPostSnippet.new(post)
      end

    end
  end
end
