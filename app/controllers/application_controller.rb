class ApplicationController < ActionController::Base
    # Rails has a set of rules when we are trying to interact
    # with a route, one of those rules checks that the user
    # that is typing into the rails form is actually the real 
    # user and because this is an API that could be used by 
    # another application such as a front end application for this
    # backend then this needs to be skipped as this logic will occur
    # on the other application.
    skip_before_action :verify_authenticity_token
    include CurrentUserConcern

end
