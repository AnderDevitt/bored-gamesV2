class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    # Sanitize devise
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, address_attributes: [:street_number, :street_name, :suburb, :state, :postcode]])
    end
end



