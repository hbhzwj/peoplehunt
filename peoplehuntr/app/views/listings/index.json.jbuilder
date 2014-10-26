json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :name, :bio, :registered_user, :skill_string, :need_string, :linkedin_token, :github_token, :linkedin_username, :github_username, :linkedin_data_api, :github_data_api, :photo
  json.url user_url(user, format: :json)
end
