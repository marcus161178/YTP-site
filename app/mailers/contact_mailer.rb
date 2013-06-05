class ContactMailer < ActionMailer::Base
  default :from => "noreply@yaisatangwell.com"
  default :to => "info@yaisatangwell.com"

   def new_message(message)
     @message = message
     mail(:subject => "[yaisatangwell.com] #{message.subject}")
   end
end
