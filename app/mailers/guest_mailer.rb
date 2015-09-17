class GuestMailer < ApplicationMailer

  def notify(guest)
    @guest = guest
    mail(to: "cluhring@gmail.com", subject: "#{guest.name} is interested in your photography.")
  end
  
end
