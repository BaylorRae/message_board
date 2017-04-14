module Board
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    rescue_from ActiveRecord::RecordNotFound do
      render '/static/404', status: 404
    end

    layout 'application'
  end
end
