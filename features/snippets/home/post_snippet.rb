module Snippets
  module Home
    class PostSnippet
      include Capybara::PomPom::Finder

      def initialize(post)
        @post = post
      end

    end
  end
end

