# To deliver this notification:
#
# ContactFormNotification.with(contact_message: @contact_message).deliver_later(User.contact_message_team)
# ContactFormNotification.with(contact_message: @contact_message).deliver(User.contact_message_team)

class ContactFormNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  deliver_by :email, mailer: "ContactMailer", method: :send_contact_message
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  def to_database 
    {
      type: self.class.name,
      params: params
    } 
  end
  param :contact_message

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  
  def subject
    # t(".message")
    "chain of fools"
  end
  
  def url
    root_path
    contact_messages
  end

  def self.contact_message_team
    User.contact_message_team
  end
end
