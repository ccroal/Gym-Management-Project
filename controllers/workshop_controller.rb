require_relative('../models/workshop.rb')
also_reload('..models/*')

get '/workshops' do
  @workshops = Workshop.all
  erb(:"workshops/index")
end
