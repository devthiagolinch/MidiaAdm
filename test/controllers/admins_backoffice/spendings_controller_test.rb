require 'test_helper'

class AdminsBackoffice::SpendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_spendings_index_url
    assert_response :success
  end

end
