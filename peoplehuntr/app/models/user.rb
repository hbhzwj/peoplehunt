class User < ActiveRecord::Base
	#rails g scaffold User first_name:string last_name:string name:string registered_user:boolean bio:string skill_string:string need_string:string linkedin_token:string github_token:string linkedin_username:string github_username:string linkedin_data_api:string github_data_api:string photo:string 
	attr_accessible :first_name, :last_name, :name, :registered_user, :bio, :skill_string, :need_string, :linkedin_token, :github_token, :linkedin_username, :github_username, :linkedin_data_api, :github_data_api, :photo
end
