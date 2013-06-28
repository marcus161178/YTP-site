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
    
    def vendorcreate
      @message = Message.new(params[:message])
      @subcategory = Subcategory.find(@message.subcategory_id)

    
      if @message.valid?
        ContactMailer.vendor_message(@message,@subcategory).deliver
        ContactMailer.ytp_message(@message,@subcategory).deliver
        ContactMailer.client_message(@message,@subcategory).deliver
        redirect_to(subcategory_path(@subcategory), :notice => "Message was successfully sent.")
      else
        flash.now.alert = "Please fill all fields."
        redirect_to(subcategory_path(@subcategory))
      end
    end
    
  end

