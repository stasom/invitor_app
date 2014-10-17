class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :event_id, :user_email, presence: true

  def self.create_invitations(invitation_event_id, user_emails)
    #invitation_event_id = params[:invitation][:event_id]
    #emails = user_emails
    #user_emails = params[:invitation][:user_emails]
    user_emails.split(", ").each do |email|
      if User.find_by_email(email)
        @invitation = Invitation.new(event_id: invitation_event_id)
        @invitation.user = User.find_by_email(email)
        @invitation.user_email = User.find_by_email(email).email
        if @invitation.save
          UserMailer.event_email(@invitation).deliver
        end

      else
        @invitation = Invitation.new(event_id: invitation_event_id)
        @invitation.user_email = email
        if @invitation.save
          UserMailer.event_email(@invitation).deliver
        end
      end
    end
  end
end
