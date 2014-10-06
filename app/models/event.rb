class Event < ActiveRecord::Base
  has_many :invitations
  has_many :users, through: :invitations

  def self.get_events_page(page)
    Event.order('start_date DESC').paginate(page: page, per_page: 5)
  end
end
