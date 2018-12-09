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

get '/sessions/:id/edit' do
  @workshops= Workshop.all
  @session = Session.find(params[:id])
  erb(:"sessions/edit")
end

post '/sessions/:id' do
  @session = Session.new(params)
  @session.update
  redirect to '/sessions'
end

post '/sessions/:id/delete' do
  session = Session.find(params[:id])
  session.delete
  redirect to '/sessions'
end
