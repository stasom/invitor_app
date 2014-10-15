class Event < ActiveRecord::Base
  has_many :invitations
  has_many :users, through: :invitations

  belongs_to :owner, class_name: 'User'
  
  def self.get_events_page(page)
    Event.order('start_date DESC')#.paginate(page: page, per_page: 5)
  end
end
