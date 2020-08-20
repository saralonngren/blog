class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!, except: [:index, :show]
end
