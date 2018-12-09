require_relative('../models/booking.rb')
require_relative('../models/session.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/bookings/new' do
  @members = Member.all
  @sessions = Session.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  erb(:"bookings/confirmation")
end
