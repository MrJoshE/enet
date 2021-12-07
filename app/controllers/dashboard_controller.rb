class DashboardController < ApplicationController
    include CurrentUserConcern
    before_action :auth_check


    def index
        @modules = users_modules
        @user = User.find_by_id(@current_user.id).email
    end

end