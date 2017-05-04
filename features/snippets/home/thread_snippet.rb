require './features/snippets/home/post_snippet'

module Snippets
  module Home
    class ThreadSnippet < Capybara::PomPom::Component
      css :post_title, ".post-title"
      components :posts, ".message", wrapper: PostSnippet

      def title
        post_title.text
      end
    end
  end
end
