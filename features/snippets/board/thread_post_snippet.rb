module Pages
  module Snippets
    module Board
      class ThreadPostSnippet

        def initialize(post)
          @post = post
        end

        def body
          @post.find('.body').text
        end

        def author
          @post.find('.author').text
        end

      end
    end
  end
end
