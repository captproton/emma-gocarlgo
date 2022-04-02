# To deliver this notification:
#
# ContactFormNotification.with(contact_message: @contact_message).deliver_later(User.contact_message_team)
# ContactFormNotification.with(contact_message: @contact_message).deliver(User.contact_message_team)

class ContactFormNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  deliver_by :email, mailer: "ContactMailer", method: :notify_team_of_contact_message
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
  end

  def self.message_subject
    cm = self._get_contact_message
    cm.subject
  end

  def self.message_details
    # cm = self._get_default_contact_message
    cm = self.params.fetch(:contact_message, self._get_default_contact_message)
  end

  def self.contact_message_team
    User.contact_message_team
  end

  def _get_default_contact_message
    ContactMessage.new(id: 0, 
      first_name: "", 
      last_name: "", 
      email: "", 
      phone_number: "", 
      subject: "default subject", 
      message: "", 
      created_at: Time.now)
  end
end
