class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, address_attributes: [:street_number, :street_name, :suburb, :state, :postcode]])
    end
end

# this will help later when I add the address
    # before_action :configure_permitted_parameters, if: :devise_controller?

    #   protected

    #   def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
    #   end

