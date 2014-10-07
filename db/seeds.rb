# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Deleting existing data.'
Event.delete_all
Invitation.delete_all
User.delete_all

puts 'All deleted, loading events, invitations and users.'

puts "Creating events"
Event.create!(name: 'mozi', start_date: "#{Time.now + 4.days}", end_date: "#{Time.now + 5.days}", location: 'Budapest', description: 'Nezzuk meg a Man in black-et!')
Event.create!(name: 'utazas', start_date: "#{Time.now + 3.years}", end_date: "#{Time.now + 4.years}", location: 'Madrid', description: 'Utazzunk el!')
Event.create!(name: 'foci', start_date: "#{Time.now - 2.days}", end_date: "#{Time.now - 1.days}", location: 'grund', description: 'Most gyoznunk kell!')

puts "Creating users"
User.create!(first_name: 'Jane', last_name: 'Who', email: 'janewho@invi.com', password:"10203040", password_confirmation:"10203040")
User.create!(first_name: 'Lajos', last_name: 'Nagy', email: 'lajosnagy@invi.com', password:"10203040", password_confirmation:"10203040")

puts "Creating invitations"
Invitation.create!(accepted: true, user_id: User.first.id, event_id: Event.first.id)
Invitation.create!(accepted: false, user_id: User.last.id, event_id: Event.last.id)
