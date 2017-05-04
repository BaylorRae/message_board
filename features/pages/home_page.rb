require './features/snippets/home/thread_snippet'

module Pages
  class HomePage < Capybara::PomPom::Page
    components :threads, ".thread", wrapper: ::Snippets::Home::ThreadSnippet

    def initialize
      visit '/'
    end
  end
end
