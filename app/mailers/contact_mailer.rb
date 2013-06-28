class ContactMailer < ActionMailer::Base
  default :from => "noreply@yaisatangwell.com"

   def new_message(message)
     @message = message
        mail(:to => "info@yaisatangwell.com", :subject => "[yaisatangwell.com] #{message.subject}")

	end
  
   def vendor_message(message,subcategory)
     @message = message
     @subcategory = subcategory
        mail(:to => @subcategory.email, :subject => "Potential Client via [yaisatangwell.com]")

	end
  def client_message(message,subcategory)
     @message = message
     @subcategory = subcategory
       mail(:to => @message.email, :subject => "Your Vendor Enquiry via [yaisatangwell.com]")

end
 def ytp_message(message,subcategory)
     @message = message
     @subcategory = subcategory
      mail(:to => "marcus@kinesisstudios.com", :subject => "#{@subcategory.name} enquiry from #{@message.name} ")

end

  
end
