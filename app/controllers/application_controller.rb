class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :configure_permitted_parameters, if: :devise_controller?
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    before_action :set_search

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def set_search
      @q = Product.ransack(params[:q])
    end

    private

    def user_not_authorized
      flash[:notice] = 'You should be admin aka seller to be able to perform this action'
      redirect_to(request.referrer || root_path)
    end
    
    def admin_required
      authenticate_user!
      if !current_user.has_role?(:admin)
        flash[:notice] = 'You should be admin aka seller to be able to perform this action'
        return redirect_to(request.referrer || root_path)
      end
    end
end
