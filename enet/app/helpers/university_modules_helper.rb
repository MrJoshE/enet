module UniversityModulesHelper


  def roomIdFromModuleId(id)
    begin
      Room.where(university_module_id: id).first.id
    rescue
      @user = User.find(session[:user_id])
      @university_module = UniversityModule.find(id)
      @user_module = UserModule.new({user_id: @current_user.id, module_id: @university_module.id})

      @user_module.save
      @room = Room.new({name: @university_module.name, university_module_id: @university_module.id})
      @room.save
      @room.id
    end
  end
end
