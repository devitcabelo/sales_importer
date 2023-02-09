class Users::PasswordsController < Devise::PasswordsController
    protected

    def after_sign_in_path_for(resource)
        new_user_session_path
    end
end