class UserAccessLevelsController < ApplicationController
  before_action :authorize
  before_action :set_user_access_level, only: [:show, :edit, :update, :destroy]

  # GET /user_access_levels
  # GET /user_access_levels.json
  def index
    @user_access_levels = UserAccessLevel.all
  end

  # GET /user_access_levels/1
  # GET /user_access_levels/1.json
  def show
  end

  # GET /user_access_levels/new
  def new
    @user_access_level = UserAccessLevel.new
  end

  # GET /user_access_levels/1/edit
  def edit
  end

  # POST /user_access_levels
  # POST /user_access_levels.json
  def create
    @user_access_level = UserAccessLevel.new(user_access_level_params)

    respond_to do |format|
      if @user_access_level.save
        format.html { redirect_to @user_access_level, notice: 'User access level was successfully created.' }
        format.json { render :show, status: :created, location: @user_access_level }
      else
        format.html { render :new }
        format.json { render json: @user_access_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_access_levels/1
  # PATCH/PUT /user_access_levels/1.json
  def update
    respond_to do |format|
      if @user_access_level.update(user_access_level_params)
        format.html { redirect_to @user_access_level, notice: 'User access level was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_access_level }
      else
        format.html { render :edit }
        format.json { render json: @user_access_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_access_levels/1
  # DELETE /user_access_levels/1.json
  def destroy
    @user_access_level.destroy
    respond_to do |format|
      format.html { redirect_to user_access_levels_url, notice: 'User access level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_access_level
      @user_access_level = UserAccessLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_access_level_params
      params.require(:user_access_level).permit(:access_level)
    end
end
