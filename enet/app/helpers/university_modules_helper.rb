module UniversityModulesHelper

  def roomIdFromModuleId(id)
    Room.where(university_module_id: id).first.id
  end
end
