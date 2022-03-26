json.extract! contact_message, :id, :first_name, :last_name, :email, :phone_number, :subject, :message, :created_at, :updated_at
json.url contact_message_url(contact_message, format: :json)
