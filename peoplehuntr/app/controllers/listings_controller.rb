class ListingsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @groups = Group.all
  end 

  def new
       @user = User.new
  end 


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :name, :bio, :registered_user, :skill_string, :need_string, :linkedin_token, :github_token, :linkedin_username, :github_username, :linkedin_data_api, :github_data_api, :photo)
    end
end
