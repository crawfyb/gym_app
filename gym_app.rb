# require( 'sinatra' )
# require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
#
# require_relative( './models/gym_classes' )
# require_relative( './models/members.rb' )
# also_reload( './models/*' )
#


require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller.rb')

get '/' do
  erb( :index )
end
