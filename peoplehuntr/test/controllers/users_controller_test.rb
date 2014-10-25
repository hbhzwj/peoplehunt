require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { bio: @user.bio, first_name: @user.first_name, github_data_api: @user.github_data_api, github_token: @user.github_token, github_username: @user.github_username, last_name: @user.last_name, linkedin_data_api: @user.linkedin_data_api, linkedin_token: @user.linkedin_token, linkedin_username: @user.linkedin_username, name: @user.name, need_string: @user.need_string, photo: @user.photo, registered_user: @user.registered_user, skill_string: @user.skill_string }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { bio: @user.bio, first_name: @user.first_name, github_data_api: @user.github_data_api, github_token: @user.github_token, github_username: @user.github_username, last_name: @user.last_name, linkedin_data_api: @user.linkedin_data_api, linkedin_token: @user.linkedin_token, linkedin_username: @user.linkedin_username, name: @user.name, need_string: @user.need_string, photo: @user.photo, registered_user: @user.registered_user, skill_string: @user.skill_string }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
