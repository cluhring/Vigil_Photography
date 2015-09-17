class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@vigil-photography.herokuapp.com"
  layout 'mailer'
end
