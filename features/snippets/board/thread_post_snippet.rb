module Pages
  module Snippets
    module Board
      class ThreadPostSnippet

        def initialize(post)
          @post = post
        end

        def title
          @post.find('.post-title').text
        end

        def body
          @post.find('.post-body').text
        end

        def author
          @post.find('.post-author').text
        end

      end
    end
  end
end
