class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    include PublicActivity::StoreController 
    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
        
    
    private

       def user_not_authorized #pundit
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
       end
end
