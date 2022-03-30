class ContactFormNotificationsController < ApplicationController
  before_action :contact_params, only: [:create]

  # POST /contact_form_notifications
  # POST /contact_form_notifications.json
  def create
    # @book = Book.new(book_params)
    @contact = {first_name: "John", last_name: "Suza"}
    @cfn     = ContactFormNotification.with(contact: @contact)

    respond_to do |format|
      if @cfn.deliver_later(current_user)
        format.html { redirect_to  backstage_books_url, notice: 'book was successfully created.' }
        # format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        # format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def contact_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname, :captcha)
  end  
end
