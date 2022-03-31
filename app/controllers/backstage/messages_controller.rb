class Backstage::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
    @default_contact_message = ContactMessage.new(
      id: 0, 
      first_name:     "", 
      last_name:      "",
      email:          "", 
      phone_number:   "", 
      subject:        "", 
      message:        "", 
      created_at: Time.now)
  end
end
