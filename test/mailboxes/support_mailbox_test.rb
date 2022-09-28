require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "A SupportRequest is created when a supporrt email is received" do
    receive_inbound_email_from_mail(
      to: "support@example.com",
      from: "me@gmail.com",
      subject: "Please help",
      body: "I am having trouble with checkout"
    )

    support_request = SupportRequest.last
    assert_equal "me@gmail.com", support_request.email
    assert_equal "Please help", support_request.subject
    assert_equal "I am having trouble with checkout", support_request.body
    assert_nil support_request.order
  end
end
