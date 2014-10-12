class UserMailer < ActionMailer::Base
  default from: 'no-reply@invi.hu'

  layout 'email.html.haml'

  def event_email(invitation)
    @invitation = invitation
    #@user = user
    # @email1 = "test@gmail.com"
    # @email2 = "test2@gmail.com"
    # @email3 = "test3@gmail.com"
    # @recipients = @email1, @email2, @email3
    # emails = @recipients.collect
    
    # mail(to: emails, subject: "Group invitation")

    mail(to: 'toni@invi.hu, bela@invi.hu, anti@invi.hu', subject: "Invitation")
  end
end
