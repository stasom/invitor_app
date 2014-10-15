class UserMailer < ActionMailer::Base
  default from: 'no-reply@invi.hu'

  layout 'email.html.haml'

  def event_email(invitation)
    @event = invitation.event
    @invitation = invitation
    if @invitation.user.first_name.present?
      @greeting = invitation.user.first_name
    else
      @greeting = invitation.user.email
    end
    #@receiver_email = receiver_email
    #@invitation = invitation
    #@user = user
    #@email1 = "toni@invi.hu"
    #@email2 = "bela@invi.hu"
    #@email3 = "antal@invi.hu"
    #@recipients = @email1, @email2, @email3
    #emails = @recipients.join(',')

    #emails = emails
    #@recipients = User.all
    #emails = @recipients.collect(&:email).join(",")

    mail(to: invitation.user.email, subject: "Group invitation")

    #mail(to: 'toni@invi.hu, bela@invi.hu, antal@invi.hu', subject: "Invitation")
  end
end
