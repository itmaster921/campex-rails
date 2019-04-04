require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get consolidated_report_selection" do
    get :consolidated_report_selection
    assert_response :success
  end

  test "should get consolidated_report" do
    get :consolidated_report
    assert_response :success
  end

end
