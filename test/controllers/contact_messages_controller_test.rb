require "test_helper"

class ContactMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_message = contact_messages(:one)
  end

  test "should get index" do
    get contact_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_message_url
    assert_response :success
  end

  test "should create contact_message" do
    assert_difference('ContactMessage.count') do
      post contact_messages_url, params: { contact_message: { email: @contact_message.email, first_name: @contact_message.first_name, last_name: @contact_message.last_name, message: @contact_message.message, phone_number: @contact_message.phone_number, subject: @contact_message.subject } }
    end

    assert_redirected_to contact_message_url(ContactMessage.last)
  end

  test "should show contact_message" do
    get contact_message_url(@contact_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_message_url(@contact_message)
    assert_response :success
  end

  test "should update contact_message" do
    patch contact_message_url(@contact_message), params: { contact_message: { email: @contact_message.email, first_name: @contact_message.first_name, last_name: @contact_message.last_name, message: @contact_message.message, phone_number: @contact_message.phone_number, subject: @contact_message.subject } }
    assert_redirected_to contact_message_url(@contact_message)
  end

  test "should destroy contact_message" do
    assert_difference('ContactMessage.count', -1) do
      delete contact_message_url(@contact_message)
    end

    assert_redirected_to contact_messages_url
  end
end
