module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role

    # When we require a parameter to be excluded during update, use the below line
    #devise_parameter_sanitizer.for(:account_update) << :role
  end
end
DeviseController.send :include, DevisePermittedParameters