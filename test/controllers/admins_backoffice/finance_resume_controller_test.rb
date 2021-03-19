require 'test_helper'

class AdminsBackoffice::FinanceResumeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_backoffice_finance_resume_index_url
    assert_response :success
  end

end
