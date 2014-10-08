class UserMailer < ActionMailer::Base
  default from: 'no-reply@inviapp.hu'
  layout 'email.html.haml'

  def event_email(user)
    @user = user

    mail(to: user.email, subject: 'Új dialog')
  end
end
