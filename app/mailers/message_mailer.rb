class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(message)
    @message = message
    @content = message.message_body

    mail to: "mannggo1999@gmail.com", subject: "General Enquiries"
  end
end
