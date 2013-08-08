class TeamMailer < ActionMailer::Base

  default from: "Lauren.itow@gmail.com"

  def contact_email(name, email, content)
    @name = name
    @email = email
    @content = content
    mail(to: "tailorapp@yahoo.com", subject: "New Comment")
  end
end
ßß