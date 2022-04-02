class ContactMessage < ApplicationRecord
    # this should be has many notifications through notification_recipient
    #   belongs_to :recipient, class_name: "User"

      after_create_commit :process_and_distribute
    def process_and_distribute
        # store_contact_and_message_in_crm
        notify_messaging_team_members
        # send_in_mode_reply_to_contact

    end

    def store_contact_and_message_in_crm
        puts "method for storing contact and message in crm"
        # this will push contact info and message into crm
        # the crm will determine whether to create as a new lead or contact
        # or to add to an existing lead or contact

    end

    def notify_messaging_team_members
        # contact messages have a respose team of one member or more
        puts "notifying sales team"
        # sends notifications (text or email) to the response team
        team            = ContactFormNotification.contact_message_team
        notification    = ContactFormNotification.with({contact_message: self}).deliver(team)

    end

    def send_in_mode_reply_to_contact
        puts "send_in_mode_message_to_contact"
        # keep the lead warm
        # reply to the contact the same way that the message was sent
        # this could be a standardized reply to the contact
        # "thanks for your message.  Someone will be with you soon."
        return self.message
    end
end
