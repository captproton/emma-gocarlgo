class ContactMessage < ApplicationRecord
    def self.process_incoming
        # store_contact_and_message_in_crm
        notify_sales_team
        # send_in_mode_message_to_contact

    end

    def self.store_contact_and_message_in_crm
        # this will push contact info and message into crm
        # the crm will determine whether to create as a new lead or contact
        # or to add to an existing lead or contact
    end

    def self.notify_sales_team
        # sends notifications (text or email) to the sales team

    end

    def self.send_in_mode_message_to_contact
        # keep the lead warm
        # reply to the contact the same way that the message was sent
        # this could be a standardized reply to the contact
        # "thanks for your message.  Someone will be with you soon."
    end
end
