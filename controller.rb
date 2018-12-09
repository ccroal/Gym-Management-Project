require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/member_controller.rb')
require_relative('./controllers/workshop_controller.rb')
require_relative('./controllers/session_controller.rb')

get '/' do
  erb(:index)
end
