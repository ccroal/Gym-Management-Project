require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/member_controller.rb')

get '/' do
  erb(:index)
end
