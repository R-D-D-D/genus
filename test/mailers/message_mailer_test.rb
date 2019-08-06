require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "contact_me" do
    message = Message.new name: 'anna',
                          email: 'anna@example.org',
                          message_body: 'hello, how are you doing?'

    email = MessageMailer.contact_me(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'General Enquiries', email.subject
    assert_equal ['mannggo1999@gmail.com'], email.to
    assert_equal ['genus.noreply@gmail.com'], email.from
    assert_match /hello, how are you doing?/, email.body.encoded
  end

  test "POST create" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post message_posts_path, params: {
        message: {
          name: 'cornholio',
          email: 'cornholio@example.org',
          message_body: 'hai'
        }
      }
    end

    assert_redirected_to new_message_url

    follow_redirect!

    assert_match /We've received the message and will get back to you soon!/, response.body
  end

end
