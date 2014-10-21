class InvitationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @invitation = Invitation.new
    @invitation.event = Event.find(params[:event_id])
    @user_emails = params[:user_emails]
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end

  def create
    @user_emails = params[:invitation][:user_emails]
    invalid_emails = Invitation.create_invitations(params[:invitation][:event_id], params[:invitation][:user_emails])
    if invalid_emails.empty?
      redirect_to event_path(params[:invitation][:event_id]), notice: 'Invitation was successfully send to ' + @user_emails + '.'
    else
      redirect_to new_invitation_path(event_id: params[:invitation][:event_id], user_emails: @user_emails), alert: 'I did not send out the invitations because these formats are invalid: ' + invalid_emails.join(', ') + '.'
    end

    # user_emails = params[:invitation][:user_emails]
    # user_emails.split(", ").each do |email|
    #   if User.find_by_email(email)
    #     @invitation = Invitation.new(event_id: params[:invitation][:event_id])
    #     @invitation.user = User.find_by_email(email)
    #     @invitation.user_email = User.find_by_email(email).email
    #     if @invitation.save
    #       UserMailer.event_email(@invitation).deliver
    #     end

    #   else
    #     @invitation = Invitation.new(event_id: params[:invitation][:event_id])
    #     #@invitation.user = User.new
    #     @invitation.user_email = email
    #     if @invitation.save
    #       UserMailer.event_email(@invitation).deliver
    #     end

    #     # respond_to do |format|
    #     #   if @invitation.save
    #     #     UserMailer.event_email(@invitation, @receivers).deliver
    #     #     redirect_to @invitation, notice: 'Invitation was successfully send.'
    #     #   else
    #     #     render :new
    #     #   end
    #     # end
    #   end
    # end
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attribute(:accepted, true)
      redirect_to edit_invitation_path, notice: 'Invitation was accepted.'
    else
      render :edit
    end
  end

  def destroy
  end
end
