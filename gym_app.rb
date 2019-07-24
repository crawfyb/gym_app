

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller.rb')
require_relative('controllers/gym_classes_controller.rb')
require_relative('controllers/gym_controller.rb')

get '/' do
  erb( :index )
end

get '/new' do
  erb(:new)
end

# new
get '/classes/new' do
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"gym_classes/new")
end
