# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class GuestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/guest_mailer/notify
  def notify
    guest = Guest.create(name: "Pete Mitchell",
                         email: "mavrick@topgun.com",
                         message: "Take me to bed, or lose me forever.")
    GuestMailer.notify(guest)
  end

end
