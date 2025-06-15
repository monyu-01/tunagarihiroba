class ApplicationController < ActionController::Base
  before_action :authenticate_member!, except: [:top, :how_to]

end
