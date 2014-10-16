class UserMailer < ActionMailer::Base
  default from: 'no-reply@invi.hu'

  layout 'email.html.haml'

  def event_email(invitation)
    @event = invitation.event
    @invitation = invitation
    if @invitation.user.present?
      @greeting = invitation.user.first_name
      mail(to: invitation.user.email, subject: "USER invitation")
    else
      @greeting = invitation.user_email
      mail(to: invitation.user_email, subject: "EMAIL invitation")
    end
    #mail(to: invitation.user.email, subject: "Group invitation")
  end
end
