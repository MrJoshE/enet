class UniversityModulesController < ApplicationController
  before_action :set_university_module, only: %i[ show edit update destroy ]
  before_action :auth_check

  include CurrentUserConcern

  # GET /university_modules or /university_modules.json
  def index
    admin_check
    @university_modules = UniversityModule.all
  end

  # GET /university_modules/1 or /university_modules/1.json
  def show
    @module = UniversityModule.find(params[:id])
  end

  # GET /university_modules/new
  def new
    admin_check
    @university_module = UniversityModule.new
  end

  # POST /university_modules or /university_modules.json
  def create
    admin_check
    @university_module = UniversityModule.new(university_module_params)
    respond_to do |format|
      if @university_module.save
        let user_module = UserModule.new({ user: @current_user,university_module:  @university_module })
        user_module.save!
        format.html { redirect_to @university_module, notice: "University module was successfully created." }
        format.json { render :show, status: :created, location: @university_module }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /university_modules/1 or /university_modules/1.json
  def update
    admin_check
    respond_to do |format|
      if @university_module.update
        format.html { redirect_to @university_module, notice: "University module was successfully updated." }
        format.json { render :show, status: :ok, location: @university_module }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @university_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /university_modules/1 or /university_modules/1.json
  def destroy
    admin_check
    @university_module.destroy
    respond_to do |format|
      format.html { redirect_to university_modules_url, notice: "University module was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university_module
      @university_module = UniversityModule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def university_module_params
      params.require(:university_module).permit(:identifier, :name, :module_leader)
    end
end
