class HomeController < ApplicationController
  def index
    @events = Event.get_events_page(params[:page])
    @future_events = Event.all.where(['start_date > ?', Time.now])
    @past_events = Event.all.where(['start_date <= ?', Time.now])
    @user = current_user
  end
end