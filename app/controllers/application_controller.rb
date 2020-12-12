class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # before_action :setContext, only: [:show, :edit]
    include PublicActivity::StoreController 
    include Pagy::Backend  
    include Pundit
    protect_from_forgery
    after_action :user_activity
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
        
    
    private
    def user_activity
        current_user.try :touch
    end

    def user_not_authorized #pundit
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end
