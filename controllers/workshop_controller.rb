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

get '/workshops/:id/edit' do
  @workshop = Workshop.find(params[:id])
  erb(:"workshops/edit")
end

post '/workshops/:id' do
  @workshop = Workshop.new(params)
  @workshop.update
  redirect to '/workshops'
end
