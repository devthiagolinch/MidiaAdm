require 'test_helper'

class AdminsBackoffice::EntrancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_entrances_index_url
    assert_response :success
  end

end
