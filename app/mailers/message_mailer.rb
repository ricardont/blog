class MessageMailer < ActionMailer::Base

  default from: "Your Mailer <noreply@sml-team.com>"
  default to: "Your Name <rontiverosmarquez@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end

end