class ContactFormMailer < ApplicationMailer
  def contact_form_filled_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: "test@example.com", subject: 'Someone requested contact')
  end    
end
