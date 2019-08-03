class ApplicationController < ActionController::Base
    include CurrentUserConcern
    skip_before_action :verify_authenticity_token
    include CurrentUserConcern
end
