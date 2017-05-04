module Pages
  module Snippets
    module Board
      class ThreadPostSnippet < Capybara::PomPom::Component
        css :body, ".body"
        css :author, ".author"
      end
    end
  end
end
