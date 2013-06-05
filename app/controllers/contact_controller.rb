  class ContactController < ApplicationController

    layout 'homelayout'
    def new
      @message = Message.new
    end

    def create
      @message = Message.new(params[:message])
    
      if @message.valid?
        ContactMailer.new_message(@message).deliver
        redirect_to(contact_path, :notice => "Message was successfully sent.")
      else
        flash.now.alert = "Please fill all fields."
        render :new
      end
    end
  end

