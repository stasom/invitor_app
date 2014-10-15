class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader, :default_url => "/images/missing.png"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :invitations
  has_many :events, through: :invitations

  has_many :own_events, class_name: 'Event', foreign_key: 'owner_id'

  # def own_events
  #   self.events
  # end
end
