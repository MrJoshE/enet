class UserModulesController::ActiveController < ApplicationController
  def create
    @user_module = UserModule.new(permitted_parms)
    @user_module.save
  end

  def destroy
    @user_module = UserModule.find(params[:id])
    @user_module.destroy
  end

  private

  def permitted_parms
    params.require(:user_module).permit(:user_id, :module_id)
  end

end