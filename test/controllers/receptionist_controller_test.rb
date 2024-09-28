require "test_helper"

class ReceptionistControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get receptionist_dashboard_url
    assert_response :success
  end
end
