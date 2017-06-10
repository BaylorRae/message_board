module Board
  class Engine < ::Rails::Engine
    isolate_namespace Board

    initializer "assets" do
        Rails.application.config.assets.precompile += %w( board/packs/board.pack.js )
    end
  end
end
