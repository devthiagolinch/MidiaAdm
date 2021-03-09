require 'test_helper'

class UsersBackoffice::UserProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backoffice_user_profile_index_url
    assert_response :success
  end

end
