require_relative('../models/workshop.rb')
also_reload('..models/*')

get '/workshops' do
  @workshops = Workshop.all
  erb(:"workshops/index")
end

get '/workshops/new' do
  erb(:"workshops/new")
end

post '/workshops' do
  Workshop.new(params).save
  redirect to '/workshops'
end
