class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_contact_message.subject
  #
  def send_contact_message
    @greeting = "Hi"
    @contact_message = params[:contact_message]
    @recipient = params[:recipient]

    mail(to: @recipient.email, subject: 'Someone requested contact')
  end
end
