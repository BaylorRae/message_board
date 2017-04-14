module Pages
  class HomePage < Capybara::PomPom::Page

    def initialize
      visit '/'
    end

    def threads
      find_all('.thread').map { |thread| ::Snippets::Home::ThreadSnippet.new(thread) }
    end

  end
end
