class DashboardController < ApplicationController
    include CurrentUserConcern
    before_action :auth_check


    def index
        user_module_ids = UserModule.where(user_id: @current_user.id).pluck(:module_id)
        @modules = UniversityModule.where(id: user_module_ids)
        @user = User.find_by_id(@current_user.id).email
    end

end