class InvitationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @invitation = Invitation.new
  end

  def edit
  end

  def create
    @invitation = Invitation.new
    respond_to do |format|
      if @invitation.save
        UserMailer.event_email(@invitation).deliver
        format.html { redirect_to @invitation, notice: 'Invitation was successfully send.' }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
