require 'test_helper'

class AdminsBackoffice::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_schedules_index_url
    assert_response :success
  end

end
