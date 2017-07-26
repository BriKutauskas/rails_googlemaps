class ApplicationController < ActionController::Base
  respond_to :html, :json

  protect_from_forgery prepend: true
end
