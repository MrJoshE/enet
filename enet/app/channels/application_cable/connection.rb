module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    include CurrentUserConcern


    def connect
      self.current_user = @current_user
    end


  end
end
