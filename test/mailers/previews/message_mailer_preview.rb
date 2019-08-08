# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/contact_me
  def contact_me
    m1 = Message.new({name: "mary", email: "mary123@gmail.com", message_body:"Hi"})
    
    MessageMailer.contact_me m1
  end

end
