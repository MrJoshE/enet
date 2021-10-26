class DashboardController < ApplicationController
    include CurrentUserConcern
    before_action :auth_check


    def index

    end
end
