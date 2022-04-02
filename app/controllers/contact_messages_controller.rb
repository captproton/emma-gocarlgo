class ContactMessagesController < ApplicationController
  layout "frontdoor"
  # before_action :set_contact_message, only: %i[ show ]

  # GET /contact_messages or /contact_messages.json
  def index
    # @contact_messages = ContactMessage.all
  end


  # POST /contact_messages or /contact_messages.json
  def create
    @contact_message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to contact_messages_url, notice: "Your message was successfully sent." }
        format.json { render :show, status: :created, location: @contact_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_contact_message
    #   @contact_message = ContactMessage.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def contact_message_params
      params.require(:contact_message).permit(:first_name, :last_name, :email, :phone_number, :subject, :message)
    end
end
