class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :destroy]

    def new
        @message = Message.new
    end 

    def create
        @message = Message.new(message_params)

        respond_to do |format|
            if @message.save
              format.html { redirect_to new_message_url, notice: "We've received the message and will get back to you soon!" }
              format.json { render :show, status: :created, location: @message }
            else
              format.html { render :new }
              format.json { render json: @message.errors, status: :unprocessable_entity }
            end
          end

        #if @message.save
        #    redirect_to new_message_url, notice: "We've received the message and will get back to you soon!"
        #else r
        #    render 'new'
        #end 
    end 

    def index
        @messages = Message.all
        # Alternative: @messages = Message.paginate(page: params[:page], per_page: 5)
    end 

    def destroy
        @message.destroy
        respond_to do |format|
          format.html { redirect_to messages_url, notice: 'Message was successfully deleted.' }
          format.json { head :no_content }
        end
    end

    private
    def set_message
        @message = Message.find(params[:id])
    end 

    def message_params
        params.require(:message).permit(:name, :email, :message_body)
    end 
end
