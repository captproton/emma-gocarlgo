require "test_helper"

class ContactFormNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get newcreate" do
    get contact_form_notifications_newcreate_url
    assert_response :success
  end
end
