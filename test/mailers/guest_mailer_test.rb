require 'test_helper'

class GuestMailerTest < ActionMailer::TestCase
  def setup
    @guest = create(:guest)
  end

  test "notify" do
    mail = GuestMailer.notify(@guest)
    assert_equal "Pete Mitchell is interested in your photography.", mail.subject
    assert_equal ["cluhring@gmail.com"], mail.to
    assert_equal ["no-reply@vigil-photography.herokuapp.com"], mail.from
    assert_match "Pete Mitchell left you a message:", mail.body.encoded
  end

  test "it creates a notification to admin" do
    GuestMailer.notify(@guest).deliver_now
    result = ActionMailer::Base.deliveries.last #captures the last message sent using action mailer
    assert_equal "Pete Mitchell is interested in your photography.", result.subject
  end

end
