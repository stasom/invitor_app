class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :event_id, presence: true
  validates :user_email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }#, uniqueness: true
  #validates_format_of :user_email,:with => Devise::email_regexp

  def self.create_invitations(invitation_event_id, user_emails)
    #invitation_event_id = params[:invitation][:event_id]
    #emails = user_emails
    #user_emails = params[:invitation][:user_emails]
    valid_invitations = []
    invalid_emails = []
    user_emails.split(", ").each do |email|
      if User.find_by_email(email)
        invitation = Invitation.new(event_id: invitation_event_id)
        invitation.user = User.find_by_email(email)
        invitation.user_email = User.find_by_email(email).email
        if invitation.valid?
          valid_invitations << invitation
        end

      else
        invitation = Invitation.new(event_id: invitation_event_id)
        invitation.user_email = email
        if invitation.valid?
          valid_invitations << invitation
        else
          invalid_emails << email
        end
      end
    end

    if invalid_emails.empty?
      valid_invitations.each do |inv|
        inv.save
        UserMailer.event_email(inv).deliver
      end
    end
    invalid_emails
  end
end
