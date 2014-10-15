class InvitationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @invitation = Invitation.new
    @invitation.event = Event.find(params[:event_id])
  end

  def edit
  end

  def create
    user_emails = params[:invitation][:user_emails]
    user_emails.split(", ").each do |email|
      if User.find_by_email(email)
        @invitation = Invitation.new(event_id: params[:invitation][:event_id])
        @invitation.user = User.find_by_email(email)
        #puts @invitation.inspect
        if @invitation.save
          UserMailer.event_email(@invitation).deliver
        end

        # respond_to do |format|
        #   if @invitation.save
        #     UserMailer.event_email(@invitation, @receivers).deliver
        #     redirect_to @invitation, notice: 'Invitation was successfully send.'
        #   else
        #     render :new
        #   end
        # end
      end
    end
  end

  def update
  end

  def destroy
  end
end
