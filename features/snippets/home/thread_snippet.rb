module Snippets
  module Home
    class ThreadSnippet
      include Capybara::PomPom::Finder

      def initialize(thread)
        @thread = thread
      end

      def title
        @thread.find('.post-title').text
      end

      def posts
        @thread.find_all('.post').map do |post|
          PostSnippet.new(post)
        end
      end
    end
  end
end
