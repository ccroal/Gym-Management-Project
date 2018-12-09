require_relative('../models/session.rb')
require_relative('../models/workshop.rb')
also_reload('../models/*')

get '/sessions' do
  @sessions = Session.all
  erb(:"sessions/index")
end
