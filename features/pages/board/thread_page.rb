module Pages
  module Board
    class ThreadPage < Capybara::PomPom::Page

      def first_post
        post = find('.post')
        Pages::Snippets::Board::ThreadPostSnippet.new(post)
      end

    end
  end
end
