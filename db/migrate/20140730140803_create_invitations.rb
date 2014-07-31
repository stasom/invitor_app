class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.boolean :accepted
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
