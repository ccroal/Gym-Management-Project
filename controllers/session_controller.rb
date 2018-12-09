require_relative('../models/session.rb')
require_relative('../models/workshop.rb')
also_reload('../models/*')

get '/sessions' do
  @sessions = Session.all
  erb(:"sessions/index")
end

get '/sessions/new' do
  @workshops = Workshop.all
  erb(:"sessions/new")
end

post '/sessions' do
  Session.new(params).save
  redirect to '/sessions'
end
